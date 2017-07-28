//
//  HHZBaseCollectionView.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZBaseCollectionView.h"

@implementation HHZBaseCollectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.kColumnCount = 4;
        self.itemSpaceX = 10.0f;
        self.itemSpaceY = 8.0f;
    }
    return self;
}

#pragma mark 创建基本视图
-(void)initializeViewsDelegate:(id<HHZCollectionViewDelegate>)delegate
{
    self.cvDelegate = delegate;
    [self createFlowLayout];
    [self createCollectionView];
}

//创建FlowLayout
-(UICollectionViewFlowLayout *)createFlowLayout
{
    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc] init];
    //空隙数量
    NSInteger spaceCount = self.kColumnCount + 1;
    
    CGFloat itemWidth = (self.bounds.size.width - spaceCount * self.itemSpaceX)/self.kColumnCount;
    //item尺寸
    flowlayout.itemSize = CGSizeMake(itemWidth, itemWidth);
    
    flowlayout.sectionInset = UIEdgeInsetsMake(self.itemSpaceY, self.itemSpaceX, self.itemSpaceY, self.itemSpaceX);
    //布局最小行间距
    flowlayout.minimumLineSpacing = self.itemSpaceY;
    //布局最小列间距
    flowlayout.minimumInteritemSpacing = self.itemSpaceX;
    
    return flowlayout;
}

//创建UICollectionView
-(void)createCollectionView
{
    UICollectionViewFlowLayout * flowlayout = [self createFlowLayout];
    self.contentCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowlayout];
    self.contentCollectionView.showsVerticalScrollIndicator = NO;
    self.contentCollectionView.showsHorizontalScrollIndicator = NO;
    self.contentCollectionView.delegate = self;
    self.contentCollectionView.dataSource = self;
    self.contentCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.contentCollectionView];
}


@end
