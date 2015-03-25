#import "G8RecognitionOperation.h"
#import "TesseractFrameWork.h"
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
            NSDictionary* dic=[strongSelf convert:tesseract.recognizedText];
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
-(NSDictionary*)convert:(NSString*)str_Tesseract
{
    NSMutableDictionary* dic=[NSMutableDictionary dictionary];
    NSMutableArray* val=[NSMutableArray array];
    NSString *staString = str_Tesseract;
    NSString *parten = @"[0-9]{1,10}\\.[0-9]{1,5}";
    NSError* error = NULL;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:parten options:0 error:&error];
    if (error!=nil) {
        return nil;
    }
    NSArray* match = [reg matchesInString
                      :staString options:NSMatchingReportCompletion range:NSMakeRange(0, [staString length])];
    if (match.count!=0)
    {
        for (NSTextCheckingResult *matc in match)
        {
            NSRange range = [matc range];
            //NSLog(@"%lu,%lu,%@",(unsigned long)range.location,(unsigned long)range.length,[staString substringWithRange:range]);
            //[staString substringWithRange:range];
            [val addObject:[staString substringWithRange:range]];
        }  
    }
    [dic setObject:val forKey:@"Numbers"];
    return dic;
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
