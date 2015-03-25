

#import <Foundation/Foundation.h>

#ifndef Tesseract_OCR_iOS_G8Constants_h
#define Tesseract_OCR_iOS_G8Constants_h

#ifndef NS_DESIGNATED_INITIALIZER
#if __has_attribute(objc_designated_initializer)
#define NS_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
#else
#define NS_DESIGNATED_INITIALIZER
#endif
#endif

typedef NS_ENUM(NSUInteger, G8PageSegmentationMode){
    G8PageSegmentationModeOSDOnly,
    G8PageSegmentationModeAutoOSD,
    G8PageSegmentationModeAutoOnly,
    G8PageSegmentationModeAuto,
    G8PageSegmentationModeSingleColumn,
    G8PageSegmentationModeSingleBlockVertText,
    G8PageSegmentationModeSingleBlock,
    G8PageSegmentationModeSingleLine,
    G8PageSegmentationModeSingleWord,
    G8PageSegmentationModeCircleWord,
    G8PageSegmentationModeSingleChar,
    G8PageSegmentationModeSparseText,
    G8PageSegmentationModeSparseTextOSD,
};

typedef NS_ENUM(NSUInteger, G8OCREngineMode){
    G8OCREngineModeTesseractOnly,
    G8OCREngineModeCubeOnly,
    G8OCREngineModeTesseractCubeCombined,
//    G8OCREngineModeDefault,
};

typedef NS_ENUM(NSUInteger, G8PageIteratorLevel){
    G8PageIteratorLevelBlock,
    G8PageIteratorLevelParagraph,
    G8PageIteratorLevelTextline,
    G8PageIteratorLevelWord,
    G8PageIteratorLevelSymbol,
};

typedef NS_ENUM(NSUInteger, G8Orientation){
    G8OrientationPageUp,
    G8OrientationPareRight,
    G8OrientationPageDown,
    G8OrientationPageLeft,
};
typedef NS_ENUM(NSUInteger, G8WritingDirection){
    G8WritingDirectionLeftToRight,
    G8WritingDirectionRightToLeft,
    G8WritingDirectionTopToBottom,
};

typedef NS_ENUM(NSUInteger, G8TextlineOrder) {
    G8TextlineOrderLeftToRight,
    G8TextlineOrderRightToLeft,
    G8TextlineOrderTopToBottom,
};

#endif
