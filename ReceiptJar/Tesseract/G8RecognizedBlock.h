

#import <UIKit/UIKit.h>
#import "G8Constants.h"

@interface G8RecognizedBlock : NSObject <NSCopying>
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, assign, readonly) CGRect boundingBox;
@property (nonatomic, assign, readonly) CGFloat confidence;
@property (nonatomic, assign, readonly) G8PageIteratorLevel level;
- (instancetype)initWithText:(NSString *)text
                 boundingBox:(CGRect)boundingBox
                  confidence:(CGFloat)confidence
                       level:(G8PageIteratorLevel)level;

- (CGRect)boundingBoxAtImageOfSize:(CGSize)imageSize;

@end
