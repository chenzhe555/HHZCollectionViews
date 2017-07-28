//
//  HHZUnusedCVCell.h
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHZCollectionViewCellModel1.h"

@interface HHZUnusedCVCell : UICollectionViewCell
/**
 *  创建Cell
 *  infoArr   模型数组 @{@"image":@"",@"title":@"",@"isUrl":@"1/0"}
 */
+(HHZUnusedCVCell *)generateCollectionViewCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath inUsedArray:(NSMutableArray *)inUsedArr unUsedArray:(NSMutableArray *)unUsedArr;
@end
