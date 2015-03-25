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

@end

const NSTimeInterval DURATION = 0.45;

@implementation DragDownAnimator{
    BOOL _isPresenting;
    id<UIViewControllerContextTransitioning> _context;
    CameraViewController* _cameraVC;
    UIViewController* _originalVC;
}

- (void)dealloc{
    NSLog(@"%@ is dealloced!", NSStringFromClass([self class]));
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    _originalVC = nil;
    _cameraVC = nil;
    _context = transitionContext;
    
    if ([[_context viewControllerForKey:UITransitionContextToViewControllerKey] isKindOfClass:[CameraViewController class]]) {
        _originalVC = [_context viewControllerForKey:UITransitionContextFromViewControllerKey];
        _cameraVC = (CameraViewController*)[_context viewControllerForKey:UITransitionContextToViewControllerKey];
        _isPresenting = YES;
    }
    else{
        _cameraVC = (CameraViewController*)[_context viewControllerForKey:UITransitionContextFromViewControllerKey];
        _originalVC = [_context viewControllerForKey:UITransitionContextToViewControllerKey];
        _isPresenting = NO;
    }
    
    if (_isPresenting) {
        [[_context containerView] addSubview: _cameraVC.view];
        
        if ([_originalVC respondsToSelector:NSSelectorFromString(@"tableView")]) {
            UITableView* tableView = [_originalVC performSelector:NSSelectorFromString(@"tableView")];
            [_originalVC.view setFrameY:tableView.contentOffset.y * -1.0];
            tableView.contentInset = UIEdgeInsetsZero;
        }
        [[_context containerView] addSubview:_originalVC.view];
        [_originalVC.navigationController setNavigationBarHidden:NO];
        
        
        [UIView animateWithDuration:[self transitionDuration:_context] animations:^(){
            [_originalVC.navigationController setNavigationBarHidden:YES];
            [_originalVC.view setFrameY:SCREEN_HEIGHT];
        } completion:^(BOOL finished){
            [_context completeTransition:finished];
        }];
    }
    else{
        [[_context containerView] addSubview:_cameraVC.view];
        
        [_originalVC.view setFrameY:SCREEN_HEIGHT];
        if ([_originalVC respondsToSelector:NSSelectorFromString(@"tableView")]) {
            UITableView* tableView = [_originalVC performSelector:NSSelectorFromString(@"tableView")];
            tableView.contentInset = UIEdgeInsetsZero;
            [[_context containerView] addSubview:_originalVC.view];
        }
        
        [_originalVC.navigationController setNavigationBarHidden:YES];
        
        
        [UIView animateWithDuration:[self transitionDuration:_context] animations:^(){
            if ([_originalVC respondsToSelector:NSSelectorFromString(@"tableView")]) {
                [_originalVC.view setFrameY:64];
            }
            else{
                [_originalVC.view setFrameY:0];
            }
            [_originalVC.navigationController setNavigationBarHidden:NO];
        } completion:^(BOOL finished){
            [_context completeTransition:finished];
        }];
    }
    
    
}

- (void)animationEnded:(BOOL)transitionCompleted{
    if (transitionCompleted) {
        [_originalVC.view setFrameY:0];
        if ([_originalVC respondsToSelector:NSSelectorFromString(@"tableView")]) {
            UITableView* tableView = [_originalVC performSelector:NSSelectorFromString(@"tableView")];
            tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        }
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return DURATION;
}


@end
