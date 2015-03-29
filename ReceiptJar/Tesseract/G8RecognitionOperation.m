#import "G8RecognitionOperation.h"
#import "TesseractFrameWork.h"
#import "ReceiptPattern.h"
#import "Patterns.h"
@interface G8RecognitionOperation() <G8TesseractDelegate>
@property (nonatomic, strong, readwrite) G8Tesseract *tesseract;
@property (nonatomic, assign, readwrite) CGFloat progress;

@end

@implementation G8RecognitionOperation

- (id) initWithLanguage:(NSString *)language
{
    self = [super init];
    if (self != nil) {
        _tesseract = [[G8Tesseract alloc] initWithLanguage:language];
        _tesseract.delegate = self;

        __weak __typeof(self) weakSelf = self;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
        self.completionBlock = ^{
            __strong __typeof(weakSelf) strongSelf = weakSelf;

            //G8RecognitionOperationCallback callback = [strongSelf.recognitionCompleteBlock copy];
            G8NewRecognitionOperationCallback callback = [strongSelf.keyRecognitionCompleteBlock copy];
            G8Tesseract *tesseract = strongSelf.tesseract;
            NSDictionary* dic=[strongSelf convert:tesseract.recognizedText pattern:[[ReceiptPattern alloc] initWithPatterID:woolWorthReceipt]];
            if (callback != nil) {
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                    callback(tesseract);
//                }];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    callback(dic);
                }];

            }
        };
#pragma clang diagnostic pop
    }
    return self;
}

- (void)main
{
    if (!self.isCancelled)
    {
        @autoreleasepool
        {
            [self.tesseract recognize];

        }
    
        
        
        
    }
}
-(NSDictionary*)convert:(NSString*)str_Tesseract pattern:(ReceiptPattern*)pattern
{
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    NSMutableArray* val=[NSMutableArray array];
    
    
    NSArray* matchPrice=[self findStringInString:str_Tesseract byRegExp:pattern.pricePattern];
    if (matchPrice.count!=0)
    {
        for (NSTextCheckingResult *matc in matchPrice)
        {
            
            NSRange range0 = [matc range];
            [val addObject:[str_Tesseract substringWithRange:range0]];
        }
        if (val!=nil)
            [dic setObject:[val copy] forKey:@"prices"];
    }
    
    [val removeAllObjects];
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    NSArray* matchItemPrices=[self findStringInString:str_Tesseract byRegExp:pattern.itemPricePattern];
    if (matchItemPrices.count!=0)
    {
        for (NSTextCheckingResult *matc in matchItemPrices)
        {
            //NSInteger rangeNum=[matc numberOfRanges];
            NSRange r=[matc rangeAtIndex:1];
            NSString* str_val=[str_Tesseract substringWithRange:r];
            [val addObject:str_val];
        }
        if (val!=nil)
            [dic setObject:[val copy] forKey:@"items"];
        
    }
    [val removeAllObjects];
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    NSArray* matchLineWords=[self findStringInString:str_Tesseract byRegExp:pattern.lineWordsPattern];
    if (matchLineWords.count!=0)
    {
        NSString* str=nil;
        for (NSTextCheckingResult *matc in matchLineWords)
        {
            
            NSRange r=[matc range];
            NSString* str_val=[str_Tesseract substringWithRange:r];
            
            NSArray* match_extra=[self findStringInString:str_val byRegExp:pattern.lastPricePattern];
            
            
            
            if (match_extra.count==0)
            {
                //[val addObject:str_val];
                NSTextCheckingResult* result=[[self findStringInString:str_val byRegExp:@".*"] objectAtIndex:0];
                NSString* str=[str_val substringWithRange:[result range]];
                if (str!=nil) {
                    [val addObject:str];
                }
                
            }
            
            
        }
        if (val!=nil)
            [dic setObject:val forKey:@"lineWords"];
        
    }
    //[val removeAllObjects];
    return dic;
    
}
-(NSArray*)findStringInString:(NSString*)wholeString byRegExp:(NSString*)regExp
{
    NSError* error = NULL;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:regExp options:0 error:&error];
    if (error!=nil)
    {
        return nil;
    }
    NSArray* match = [reg matchesInString
                      :wholeString options:NSMatchingReportCompletion range:NSMakeRange(0, [wholeString length])];
    if (match.count!=0)
    {
        return match;
    }
    return nil;
}
- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract
{
    self.progress = self.tesseract.progress / 100.0f;

    if (self.progressCallbackBlock != nil) {
        self.progressCallbackBlock(self.tesseract);
    }

    if ([self.delegate respondsToSelector:@selector(progressImageRecognitionForTesseract:)]) {
        [self.delegate progressImageRecognitionForTesseract:tesseract];
    }
}

- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract
{
    BOOL canceled = self.isCancelled;
    if (canceled == NO && [self.delegate respondsToSelector:@selector(shouldCancelImageRecognitionForTesseract:)]) {
        canceled = [self.delegate shouldCancelImageRecognitionForTesseract:tesseract];
    }
    return canceled;
}

@end
