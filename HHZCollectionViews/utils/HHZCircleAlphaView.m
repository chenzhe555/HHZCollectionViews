//
//  HHZCircleAlphaView.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/28.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCircleAlphaView.h"

@interface HHZCircleAlphaView ()
@property (nonatomic, strong) UIColor * roundColor;
@end

@implementation HHZCircleAlphaView

-(void)drawRect:(CGRect)rect
{
    CGRect circleRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0];
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    
    CAShapeLayer * fillLayer = [CAShapeLayer layer];
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    if(!self.roundColor)
    {
        fillLayer.fillColor = [UIColor whiteColor].CGColor;
    }
    else
    {
        fillLayer.fillColor = self.roundColor.CGColor;
    }
    
    [self.layer addSublayer:fillLayer];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor clearColor].CGColor;
    }
    return self;
}

-(void)changeAroundColor:(UIColor *)roundColor
{
    self.roundColor = roundColor;
}


@end
