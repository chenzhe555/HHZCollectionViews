//
//  HHZCommonCollectionView.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCommonCollectionView.h"

@interface HHZCommonCollectionView ()
//被拖动的item
@property (nonatomic, strong) HHZCommonCollectionViewCell * dragingCell;
//被拖动item的indexPath
@property (nonatomic, strong) NSIndexPath * dragingFromIndexPath;
//目标item的indexPath
@property (nonatomic, strong) NSIndexPath * dragingToIndexPath;
//当前所有的item
@property (nonatomic, strong) NSMutableArray * infoArray;
@end

@implementation HHZCommonCollectionView

-(void)configInfoArr:(NSArray *)infoArr
{
    self.infoArray = [NSMutableArray arrayWithArray:infoArr];
}

-(void)initializeViewsDelegate:(id<HHZCollectionViewDelegate>)delegate
{
    [super initializeViewsDelegate:delegate];
    [self createDragedItem];
}

-(void)createDragedItem
{
    CGFloat itemWidth = (self.bounds.size.width - (self.kColumnCount + 1) * self.itemSpaceX)/self.kColumnCount;
    self.dragingCell = [[HHZCommonCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, itemWidth, itemWidth)];
    self.dragingCell.hidden = YES;
    [self.contentCollectionView addSubview:self.dragingCell];
}

-(void)createCollectionView
{
    [super createCollectionView];
    
    [self.contentCollectionView registerClass:[HHZCommonCollectionViewCell class] forCellWithReuseIdentifier:@"HHZCommonCollectionViewCellIndentifier"];
        
    UILongPressGestureRecognizer * gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHappen:)];
    gesture.minimumPressDuration = 0.3f;
    [self.contentCollectionView addGestureRecognizer:gesture];
}

-(void)configInfoArray:(NSArray *)usedArr
{
    self.infoArray = [NSMutableArray arrayWithArray:usedArr];
}

-(NSArray *)gainInfoArray
{
    return self.infoArray;
}


#pragma mark 手势事件响应
-(void)longPressHappen:(UILongPressGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:self.contentCollectionView];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            [self dragBegin:point];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self dragMove:point];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self dragEnd:point];
        }
            break;
            
        default:
            break;
    }
}

-(void)dragBegin:(CGPoint)point
{
    //找到拖拽的Cell
    self.dragingFromIndexPath = [self findFromItemIndexPath:point];
    if (!self.dragingFromIndexPath) return;
        
    [self.contentCollectionView bringSubviewToFront:self.dragingCell];
    
    //设定当前拖拽的为移动状态
    HHZCommonCollectionViewCell * cell = (HHZCommonCollectionViewCell *)[self.contentCollectionView cellForItemAtIndexPath:self.dragingFromIndexPath];
    [cell changeCellMoveState:YES];
    
    //修改dragcell的样式
    HHZCollectionViewCellModel1 * model = [cell getCellModel];
    self.dragingCell.frame = cell.frame;
    [self.dragingCell changeCellModelValue:model];
    self.dragingCell.hidden = NO;
    self.dragingCell.transform = CGAffineTransformMakeScale(1.4f, 1.4f);
}

-(void)dragMove:(CGPoint)point
{
    if (!self.dragingFromIndexPath) return;
    
    self.dragingCell.center = point;
    self.dragingToIndexPath = [self findToItemIndexPath:point];
    
    if (self.dragingToIndexPath)
    {
        //交换数据并移动位置
        [self exchangeArrayData];
        [self.contentCollectionView moveItemAtIndexPath:self.dragingFromIndexPath toIndexPath:self.dragingToIndexPath];
        self.dragingFromIndexPath = self.dragingToIndexPath;
    }
}

-(void)dragEnd:(CGPoint)point
{
    if (!self.dragingFromIndexPath) return;
    
    CGRect newFrame = [self.contentCollectionView cellForItemAtIndexPath:self.dragingFromIndexPath].frame;
    _dragingCell.transform = CGAffineTransformMakeScale(1.0, 1.0);
    [UIView animateWithDuration:0.3f animations:^{
        self.dragingCell.frame = newFrame;
    } completion:^(BOOL finished) {
        self.dragingCell.hidden = YES;
        
        HHZCommonCollectionViewCell * cell = (HHZCommonCollectionViewCell *)[self.contentCollectionView cellForItemAtIndexPath:self.dragingFromIndexPath];
        [cell changeCellMoveState:NO];
    }];
}

-(void)exchangeArrayData
{
    [self.infoArray exchangeObjectAtIndex:self.dragingFromIndexPath.row withObjectAtIndex:self.dragingToIndexPath.row];
}

#pragma mark 获取移动Item和目标Item的IndexPath
-(NSIndexPath *)findFromItemIndexPath:(CGPoint)point
{
    self.dragingFromIndexPath = nil;
    NSIndexPath * findPath = nil;
    NSArray * visibleArr = [self.contentCollectionView indexPathsForVisibleItems];
    
    for (NSIndexPath * indexPath in visibleArr)
    {
        BOOL isContain = CGRectContainsPoint([self.contentCollectionView cellForItemAtIndexPath:indexPath].frame, point);
        if (isContain)
        {
            findPath = indexPath;
            break;
        }
    }
    return findPath;
}

-(NSIndexPath *)findToItemIndexPath:(CGPoint)point
{
    NSIndexPath * findPath = nil;
    NSArray * visibleArr = [self.contentCollectionView indexPathsForVisibleItems];
    
    for (NSIndexPath * indexPath in visibleArr)
    {
        if (self.dragingFromIndexPath == indexPath) continue;
        
        BOOL isContain = CGRectContainsPoint([self.contentCollectionView cellForItemAtIndexPath:indexPath].frame, point);
        if (isContain)
        {
            findPath = indexPath;
            break;
        }
    }
    return findPath;
}

#pragma mark UICollectionView回调方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.infoArray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HHZCommonCollectionViewCell * cell = [HHZCommonCollectionViewCell generateCollectionViewCell:collectionView indexPath:indexPath infoArray:self.infoArray];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cvDelegate && [self.cvDelegate respondsToSelector:@selector(dlselectItemCollectionView:indexPath:)])
    {
        [self.cvDelegate dlselectItemCollectionView:collectionView indexPath:indexPath];
    }
}

@end
