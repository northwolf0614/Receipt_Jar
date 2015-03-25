//
//  TesseractRecognizer.h
//  Tesseract_Demo
//
//  Created by Jack Lin on 25/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TesseractFrameWork.h"
@interface TesseractRecognizer : NSObject<G8TesseractDelegate>
-(void)recognizeImageWithTesseract:(UIImage *)image onCompletion:(void (^)(NSDictionary* recognizedData))completionHandler;

+(id)sharedRecognizerWithDelegateHolder:(id<G8TesseractDelegate>) delegateHolder;
+(void)clearCache;


@end
