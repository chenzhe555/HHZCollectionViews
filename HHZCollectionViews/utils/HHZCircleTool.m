//
//  HHZCircleTool.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/28.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCircleTool.h"

@implementation HHZCircleTool
+(UIImage *)getImageRadius:(CGFloat)radius andImage:(UIImage *)image
{
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(image.size, NO, scale);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextAddPath(ref, path.CGPath);
    CGContextClip(ref);
    [image drawInRect:rect];
    CGContextDrawPath(ref, kCGPathFillStroke);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
