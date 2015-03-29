#import "CDDocument.h"

@interface CDDocument ()

// Private interface goes here.

@end

@implementation CDDocument
@synthesize image = _image;
// Custom logic goes here.

- (UIImage*)image{
    if (_image) {
        return _image;
    }
    if (self.file) {
        _image = [UIImage imageWithData:self.file];
    }
    return _image;
}

- (void)setImage:(UIImage *)image{
    if (_image == image) {
        return;
    }
    _image = image;
    self.file = UIImageJPEGRepresentation(image, 1.0);
}

@end
