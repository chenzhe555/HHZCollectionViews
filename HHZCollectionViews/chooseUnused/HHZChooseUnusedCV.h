//
//  HHZChooseUnusedCV.h
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZBaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHZChooseUnusedCV : HHZBaseCollectionView
/**
 *  配置CollectionView的正在使用的应用数据数组
 *
 */
-(void)configInUsedInfos:(NSArray *)usedArr;
/**
 *  配置CollectionView的未使用的应用数据数组
 *  
 */
-(void)configUnUsedInfos:(NSArray *)unUsedArr;

-(NSArray *)gainUsedArray;
-(NSArray *)gainUnUesdArray;
@end

NS_ASSUME_NONNULL_END
