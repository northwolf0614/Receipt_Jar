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

@interface DragDownAnimator ()
@property(nonatomic,readonly)float relativePercentage;
@end

const NSTimeInterval DURATION = 0.3;

@implementation DragDownAnimator{
    float _absPercentage;
    BOOL _isPresenting;
}

- (float)relativePercentage{
    return _isPresenting ? 1 - _absPercentage : _absPercentage;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
}

- (void)animationEnded:(BOOL)transitionCompleted{
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return DURATION;
}

#pragma mark - UIViewControllerInteractiveTransitioning

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
}

- (UIViewAnimationCurve)completionCurve{
    return _isPresenting ? UIViewAnimationCurveEaseIn : UIViewAnimationCurveEaseOut;
}

- (CGFloat)completionSpeed{
    return 1.0 - self.relativePercentage;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source{
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
@end
