//
//  HHZCommonCollectionView.h
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZBaseCollectionView.h"
#import "HHZCommonCollectionViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface HHZCommonCollectionView : HHZBaseCollectionView
/**
 *  配置CollectionView的数据数组
 *
 */
-(void)configInfoArray:(NSArray *)usedArr;

/**
 *  获取CollectionView的数据数组
 *
 */
-(NSArray *)gainInfoArray;
@end

NS_ASSUME_NONNULL_END
