//
//  DragDownAnimator.h
//  ReceiptJar
//
//  Created by Lei Zhao on 24/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ExpenseTableViewController, CameraViewController;

@interface DragDownAnimator : NSObject<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
@property(nonatomic, weak)ExpenseTableViewController* expenseViewController;
@property(nonatomic, weak)CameraViewController* cameraViewController;

@end
