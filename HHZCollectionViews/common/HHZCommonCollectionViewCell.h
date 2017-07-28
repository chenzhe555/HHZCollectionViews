//
//  HHZCommonCollectionViewCell.h
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHZCollectionViewCellModel1.h"

@interface HHZCommonCollectionViewCell : UICollectionViewCell
/**
 *  创建Cell
 *  infoArr   模型数组 @{@"image":@"",@"title":@"",@"isUrl":@"1/0"}
 */
+(HHZCommonCollectionViewCell *)generateCollectionViewCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath infoArray:(NSMutableArray *)infoArr;

/**
*  改变当前长按cell的状态值
*  isMoving 当前Cell是否正被拖拽
*/
-(void)changeCellMoveState:(BOOL)isMoving;

/**
 *  改变Cell的基本信息
 *  model 获取当前Cell数据
 */
-(void)changeCellModelValue:(HHZCollectionViewCellModel1 *)model;

-(HHZCollectionViewCellModel1 *)getCellModel;
@end
