

#ifndef Tesseract_OCR_iOS_G8TesseractDelegate_h
#define Tesseract_OCR_iOS_G8TesseractDelegate_h

@class G8Tesseract;
@class UIImage;

@protocol G8TesseractDelegate <NSObject>

@optional

- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract;
- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract;
- (UIImage *)preprocessedImageForTesseract:(G8Tesseract *)tesseract sourceImage:(UIImage *)sourceImage;

@end

#endif
