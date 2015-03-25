//
//  DragDownAnimator.m
//  ReceiptJar
//
//  Created by Lei Zhao on 24/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "DragDownAnimator.h"
#import <iOS_Utility/iOS_Utility.h>
#import "ExpenseTableViewController.h"
#import "CameraViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface DragDownAnimator ()
@property(nonatomic,readonly)float relativePercentage;
@property(nonatomic, weak)ExpenseTableViewController* expenseVC;
@property(nonatomic, weak)CameraViewController* cameraVC;
@property(nonatomic, weak)id<UIViewControllerContextTransitioning> context;
@end

const NSTimeInterval DURATION = 0.45;

@implementation DragDownAnimator{
    BOOL _isPresenting;
    UIView* _tableViewWrapper;
}

- (void)dealloc{
    NSLog(@"%@ is dealloced!", NSStringFromClass([self class]));
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.expenseVC = nil;
    self.cameraVC = nil;
    self.context = transitionContext;
    
    if ([[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] isKindOfClass:[CameraViewController class]]) {
        self.expenseVC = (ExpenseTableViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        self.cameraVC = (CameraViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        _isPresenting = YES;
    }
    else{
        self.cameraVC = (CameraViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        self.expenseVC = (ExpenseTableViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        _isPresenting = NO;
    }
    
    if (_isPresenting) {
        [[self.context containerView] addSubview: self.cameraVC.view];
        
        [self.expenseVC.view setFrameY:self.expenseVC.tableView.contentOffset.y * -1];
        self.expenseVC.tableView.contentInset = UIEdgeInsetsZero;
        [[self.context containerView] addSubview:self.expenseVC.view];
        
        [self.expenseVC.navigationController setNavigationBarHidden:NO];
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^(){
            [self.expenseVC.navigationController setNavigationBarHidden:YES];
            [self.expenseVC.view setFrameY:SCREEN_HEIGHT];
        } completion:^(BOOL finished){
            [self.context completeTransition:finished];
        }];
    }
    else{
        [[self.context containerView] addSubview:self.cameraVC.view];
        
        [self.expenseVC.view setFrameY:SCREEN_HEIGHT];
        self.expenseVC.tableView.contentInset = UIEdgeInsetsZero;
        [[self.context containerView] addSubview:self.expenseVC.view];
        
        [self.expenseVC.navigationController setNavigationBarHidden:YES];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^(){
            [self.expenseVC.view setFrameY:64];
            [self.expenseVC.navigationController setNavigationBarHidden:NO];
        } completion:^(BOOL finished){
            [self.context completeTransition:finished];
        }];
    }
    
    
}

- (void)animationEnded:(BOOL)transitionCompleted{
    if (_isPresenting && transitionCompleted) {
        
    }
    else if (!_isPresenting && transitionCompleted){
        [self.expenseVC.view setFrameY:0];
        self.expenseVC.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return DURATION;
}


#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
}


@end
