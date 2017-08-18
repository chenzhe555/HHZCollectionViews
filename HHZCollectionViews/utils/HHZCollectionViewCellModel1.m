//
//  HHZCollectionViewCellModel1.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCollectionViewCellModel1.h"
#import <HHZCategory/NSObject+HHZCategory.h>

@implementation HHZCollectionViewCellModel1
HHZ_AutoCoding

+(HHZCollectionViewCellModel1 *)generateModelTitle:(NSString *)title Image:(NSString *)image isUrl:(BOOL)isUrl
{
    HHZCollectionViewCellModel1 * model = [[HHZCollectionViewCellModel1 alloc] init];
    model.title = title;
    model.image = image;
    model.isUrl = isUrl;
    return model;
}
@end
