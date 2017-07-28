//
//  HHZCollectionViewCellModel1.h
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZCollectionViewCellModel1 : NSObject
@property (nonatomic, copy) NSString * image;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) BOOL isUrl;
/**
 *  （图片加文本）实例化Model
 */
+(HHZCollectionViewCellModel1 *)generateModelTitle:(NSString *)title Image:(NSString *)image isUrl:(BOOL)isUrl;
@end

NS_ASSUME_NONNULL_END
