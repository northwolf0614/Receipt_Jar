//
//  SymbolView.m
//  ReceiptJar
//
//  Created by Lei Zhao on 20/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "SymbolView.h"

@implementation SymbolView

- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void)prepareForInterfaceBuilder{
    [super prepareForInterfaceBuilder];
    [self setup];
}

- (void)setSymbolColor:(UIColor *)symbolColor{
    if (_symbolColor == symbolColor) {
        return;
    }
    _symbolColor = symbolColor;
    [self setup];
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    if (borderWidth == _borderWidth) {
        return;
    }
    _borderWidth = borderWidth;
    [self setup];
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    if (_cornerRadius == cornerRadius) {
        return;
    }
    _cornerRadius = cornerRadius;
    [self setup];
}

- (void)sizeToFit{
    [super sizeToFit];
    NSLog(@"size to fit");
}

- (void)setup{
    self.textAlignment= NSTextAlignmentCenter;
    self.textColor = self.symbolColor;
    self.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
    self.layer.borderColor = self.symbolColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
    self.layer.cornerRadius = self.cornerRadius;
}
@end
