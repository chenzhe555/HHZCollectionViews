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
/**
 *  图片名称或者地址
 */
@property (nonatomic, copy) NSString * image;
/**
 *  底部文字信息
 */
@property (nonatomic, copy) NSString * title;
/**
 *  是否是来自于网络的图片
 */
@property (nonatomic, assign) BOOL isUrl;
/**
 *  图片是否为圆角
 */
@property (nonatomic, assign) BOOL imageIsCircle;
/**
 *  （图片加文本）实例化Model
 */
+(HHZCollectionViewCellModel1 *)generateModelTitle:(NSString *)title Image:(NSString *)image isUrl:(BOOL)isUrl;
@end

NS_ASSUME_NONNULL_END
