//
//  SymbolView.h
//  ReceiptJar
//
//  Created by Lei Zhao on 20/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SymbolView : UILabel
@property (nonatomic, strong)IBInspectable UIColor* symbolColor;
@property (nonatomic, assign)IBInspectable CGFloat borderWidth;
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@end
