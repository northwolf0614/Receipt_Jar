

#import <UIKit/UIKit.h>
#import "G8Constants.h"
#import "G8TesseractDelegate.h"

extern NSInteger const kG8DefaultResolution;
extern NSInteger const kG8MinCredibleResolution;
extern NSInteger const kG8MaxCredibleResolution;
@interface G8Tesseract : NSObject
+ (NSString *)version;
+ (void)clearCache;
@property (nonatomic, copy) NSString* language;
@property (nonatomic, readonly, copy) NSString *absoluteDataPath;
@property (nonatomic, assign) G8OCREngineMode engineMode;
@property (nonatomic, assign) G8PageSegmentationMode pageSegmentationMode;
@property (nonatomic, copy) NSString *charWhitelist;
@property (nonatomic, copy) NSString *charBlacklist;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) CGRect rect;
@property (nonatomic, assign) NSInteger sourceResolution;
@property (nonatomic, assign) NSTimeInterval maximumRecognitionTime;
@property (nonatomic, readonly) NSUInteger progress;
@property (nonatomic, readonly) NSString *recognizedText;
- (NSString *)recognizedHOCRForPageNumber:(int)pageNumber;
@property (nonatomic, readonly) G8Orientation orientation;
@property (nonatomic, readonly) G8WritingDirection writingDirection;
@property (nonatomic, readonly) G8TextlineOrder textlineOrder;
@property (nonatomic, readonly) CGFloat deskewAngle;
@property (nonatomic, readonly) NSArray *characterChoices;
- (NSArray *)recognizedBlocksByIteratorLevel:(G8PageIteratorLevel)pageIteratorLevel;

#pragma mark - Debug methods

@property (nonatomic, readonly) UIImage *thresholdedImage;
- (UIImage *)imageWithBlocks:(NSArray *)blocks
                    drawText:(BOOL)drawText
                 thresholded:(BOOL)thresholded;

@property (nonatomic, weak) id<G8TesseractDelegate> delegate;

/// The default initializer should not be used since the language Tesseract
/// uses needs to be explicit.
- (instancetype)init __attribute__((unavailable("Use initWithLanguage:language instead")));
- (id)initWithLanguage:(NSString*)language;
- (id)initWithLanguage:(NSString*)language
            engineMode:(G8OCREngineMode)engineMode;
- (id)initWithLanguage:(NSString *)language
      configDictionary:(NSDictionary *)configDictionary
       configFileNames:(NSArray *)configFileNames
 cachesRelatedDataPath:(NSString *)cachesRelatedDataPath
            engineMode:(G8OCREngineMode)engineMode NS_DESIGNATED_INITIALIZER;

- (void)setVariableValue:(NSString *)value forKey:(NSString *)key;
- (NSString*)variableValueForKey:(NSString *)key;
- (void)setVariablesFromDictionary:(NSDictionary *)dictionary;
- (BOOL)recognize;
@end
