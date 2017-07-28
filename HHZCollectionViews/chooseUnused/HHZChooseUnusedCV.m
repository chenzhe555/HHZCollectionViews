//
//  HHZChooseUnusedCV.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZChooseUnusedCV.h"
#import "HHZUnusedCVCell.h"
#import "HHZUnusedReusableView.h"

@interface HHZChooseUnusedCV ()<UICollectionViewDelegate,UICollectionViewDataSource>
//被拖动的item
@property (nonatomic, strong) HHZUnusedCVCell * dragingCell;
//被拖动item的indexPath
@property (nonatomic, strong) NSIndexPath * dragingFromIndexPath;
//目标item的indexPath
@property (nonatomic, strong) NSIndexPath * dragingToIndexPath;
//可以使用的item
@property (nonatomic, strong) NSMutableArray * inUsedArray;
//不可使用的item，在下面
@property (nonatomic, strong) NSMutableArray * unUsedArray;

@end

@implementation HHZChooseUnusedCV

-(void)configInUsedInfos:(NSArray *)usedArr
{
    self.inUsedArray = [NSMutableArray arrayWithArray:usedArr];
}

-(void)configUnUsedInfos:(NSArray *)unUsedArr
{
    self.unUsedArray = [NSMutableArray arrayWithArray:unUsedArr];
}

#pragma mark 创建基本视图
-(void)initializeViewsDelegate:(id<HHZCollectionViewDelegate>)delegate
{
    [super initializeViewsDelegate:delegate];
}


//创建FlowLayout
-(UICollectionViewFlowLayout *)createFlowLayout
{
    UICollectionViewFlowLayout * flowlayout = [super createFlowLayout];
    //HeaderView尺寸
    flowlayout.headerReferenceSize = CGSizeMake(self.bounds.size.width, 30);
    
    return flowlayout;
}

//创建UICollectionView
-(void)createCollectionView
{
    [super createCollectionView];
    
    [self.contentCollectionView registerClass:[HHZUnusedCVCell class] forCellWithReuseIdentifier:@"HHZUnusedCVCellIndentifier"];
    [self.contentCollectionView registerClass:[HHZUnusedReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellHeaderViewIndentifier"];
}



#pragma mark UICollectionView回调方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return section ==0 ? self.inUsedArray.count:self.unUsedArray.count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HHZUnusedReusableView * headView = nil;
    if (indexPath.section == 0)
    {
        headView = [HHZUnusedReusableView getReuseableView:collectionView indexPath:indexPath leftTitle:@"我的应用" rightTitle:@"点击删除应用"];
    }
    else
    {
        headView = [HHZUnusedReusableView getReuseableView:collectionView indexPath:indexPath leftTitle:@"未选择的应用" rightTitle:@"点击添加应用"];
    }
    return headView;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HHZUnusedCVCell * cell = [HHZUnusedCVCell generateCollectionViewCell:collectionView indexPath:indexPath inUsedArray:self.inUsedArray unUsedArray:self.unUsedArray];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        id obj = [self.inUsedArray objectAtIndex:indexPath.row];
        [self.inUsedArray removeObject:obj];
        [self.unUsedArray insertObject:obj atIndex:0];
        [self.contentCollectionView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
        
    }
    else
    {
        id obj = [self.unUsedArray objectAtIndex:indexPath.row];
        [self.unUsedArray removeObject:obj];
        [self.inUsedArray addObject:obj];
        [self.contentCollectionView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:(self.inUsedArray.count - 1) inSection:0]];
    }
}

@end
