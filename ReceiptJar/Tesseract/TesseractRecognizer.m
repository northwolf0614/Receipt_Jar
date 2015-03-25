//
//  TesseractRecognizer.m
//  Tesseract_Demo
//
//  Created by Jack Lin on 25/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "TesseractRecognizer.h"
@interface TesseractRecognizer()
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) UIImageView *imageToRecognize;
@property(nonatomic,weak)id<G8TesseractDelegate> delegate;
-(id)initWithDelegate:(id<G8TesseractDelegate>)delegateHolder;
@end
@implementation TesseractRecognizer
-(id)initWithDelegate:(id<G8TesseractDelegate>)delegateHolder
{
    if (self=[super init]) {
        _operationQueue=[[NSOperationQueue alloc] init];
        _delegate=delegateHolder;
        
    }
    return self;
}


-(void)recognizeImageWithTesseract:(UIImage *)image onCompletion:(void (^)(NSDictionary* recognizedData))completionHandler;
{

    UIImage *bwImage = [image g8_blackAndWhite];
    self.imageToRecognize.image = bwImage;
    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng"];
    operation.tesseract.engineMode = G8OCREngineModeTesseractOnly;
    operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAutoOnly;
    operation.delegate = _delegate;
    operation.tesseract.charWhitelist =@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-+%@$0123456789";
    operation.tesseract.image = bwImage;
    operation.keyRecognitionCompleteBlock=completionHandler;

    
    // Finally, add the recognition operation to the queue
    [self.operationQueue addOperation:operation];
}
+(void)clearCache
{
    [G8Tesseract clearCache];
}

+(id)sharedRecognizerWithDelegateHolder:(id<G8TesseractDelegate>) delegateHolder
{
    
    static dispatch_once_t pred;
    static TesseractRecognizer *singleRecog = nil;
    dispatch_once(&pred, ^{
        singleRecog = [[TesseractRecognizer alloc] initWithDelegate:delegateHolder];
    });
    return singleRecog;

}


@end
