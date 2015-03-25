

#import <UIKit/UIKit.h>

#import "G8Tesseract.h"

typedef void(^G8RecognitionOperationCallback)(G8Tesseract *tesseract);
typedef void(^G8NewRecognitionOperationCallback)(NSDictionary *tesseractDic);
@interface G8RecognitionOperation : NSOperation
@property (nonatomic, strong, readonly) G8Tesseract *tesseract;
@property (nonatomic, weak) id<G8TesseractDelegate> delegate;
@property (nonatomic, assign, readonly) CGFloat progress;
@property (nonatomic, copy) G8RecognitionOperationCallback recognitionCompleteBlock;
@property (nonatomic, copy) G8NewRecognitionOperationCallback keyRecognitionCompleteBlock;
@property (nonatomic, copy) G8RecognitionOperationCallback progressCallbackBlock;
@property (copy) void (^completionBlock)(void) DEPRECATED_ATTRIBUTE;
- (instancetype)init __attribute__((unavailable("Use initWithLanguage:language instead")));
- (id)initWithLanguage:(NSString*)language;

@end
