//
//  DragDownAnimator.m
//  ReceiptJar
//
//  Created by Lei Zhao on 24/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "DragDownAnimator.h"
#import "ExpenseTableViewController.h"
#import "CameraViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface DragDownAnimator ()
@property(nonatomic,readonly)float relativePercentage;
@property(nonatomic, weak)ExpenseTableViewController* expenseVC;
@property(nonatomic, weak)CameraViewController* cameraVC;
@property(nonatomic, weak)UINavigationController* navController;
@property(nonatomic, weak)id<UIViewControllerContextTransitioning> context;
@end

const NSTimeInterval DURATION = 5;

@implementation DragDownAnimator{
    BOOL _isPresenting;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.expenseVC = nil;
    self.cameraVC = nil;
    self.navController = nil;
    self.context = transitionContext;
    
    if ([[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] isKindOfClass:[CameraViewController class]]) {
        self.navController = (UINavigationController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        self.cameraVC = (CameraViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        _isPresenting = YES;
    }
    else{
        self.cameraVC = (CameraViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        self.navController = (UINavigationController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        _isPresenting = NO;
    }
    
    for (UIViewController* c in self.navController.childViewControllers) {
        if ([c isKindOfClass:[ExpenseTableViewController class]]) {
            self.expenseVC = (ExpenseTableViewController*)c;
            break;
        }
    }
    
    if (_isPresenting) {
        [NSLayoutConstraint deactivateConstraints:@[self.expenseVC.tableHeaderViewTop]];
        [[self.context containerView] addSubview: self.cameraVC.view];
        
        CGRect frame = self.expenseVC.view.frame;
        frame.origin.y = fabs(self.expenseVC.tableView.contentOffset.y);
        self.expenseVC.view.frame = frame;
        
        self.expenseVC.tableHeaderView.backgroundColor = [UIColor clearColor];
        self.expenseVC.tableView.contentInset = UIEdgeInsetsZero;
        self.expenseVC.tableView.contentOffset = CGPointZero;

        
        [[self.context containerView] addSubview:self.expenseVC.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^(){
            CGRect frame = self.expenseVC.view.frame;
            frame.origin.y = 800;
            self.expenseVC.view.frame = frame;
        }];
    }
    
    
}

- (void)animationEnded:(BOOL)transitionCompleted{
    
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
