//
//  HHZBaseCollectionView.h
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHZCollectionViewCellModel1.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HHZCollectionViewDelegate <NSObject>
@optional
/**
 *  点击某个item
 */
-(void)dlselectItemCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end

@interface HHZBaseCollectionView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, assign) id<HHZCollectionViewDelegate> cvDelegate;

@property (nonatomic, strong) UICollectionView * contentCollectionView;
//列数
@property (nonatomic, assign) NSInteger kColumnCount;
//item横间隙
@property (nonatomic, assign) CGFloat itemSpaceX;
//item竖间隙
@property (nonatomic, assign) CGFloat itemSpaceY;


-(void)initializeViewsDelegate:(id<HHZCollectionViewDelegate>)delegate;

//创建FlowLayout
-(UICollectionViewFlowLayout *)createFlowLayout;

//创建UICollectionView
-(void)createCollectionView;


@end

NS_ASSUME_NONNULL_END
