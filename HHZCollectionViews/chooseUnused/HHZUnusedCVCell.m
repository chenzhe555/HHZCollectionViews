//
//  HHZUnusedCVCell.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZUnusedCVCell.h"
#import "HHZCircleAlphaView.h"

#define kImageAndTextSpace 10

@interface HHZUnusedCVCell ()
@property (nonatomic, strong) UIImageView * imgView;
@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) HHZCollectionViewCellModel1 * model;
@property (nonatomic, strong) HHZCircleAlphaView * circleView;
@end

@implementation HHZUnusedCVCell

+(HHZUnusedCVCell *)generateCollectionViewCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath inUsedArray:(NSMutableArray *)inUsedArr unUsedArray:(NSMutableArray *)unUsedArr
{
    HHZUnusedCVCell * cell = nil;
    if (indexPath.section == 0)
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHZUnusedCVCellIndentifier" forIndexPath:indexPath];
        [cell changeCellModelValue:inUsedArr[indexPath.row]];
    }
    else
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HHZUnusedCVCellIndentifier" forIndexPath:indexPath];
        [cell changeCellModelValue:unUsedArr[indexPath.row]];
    }
    
    return cell;
}

-(UIImageView *)imgView
{
    if (!_imgView)
    {
        _imgView = [[UIImageView alloc] init];
        _imgView.frame = CGRectMake(self.bounds.size.width/4.0, self.bounds.size.height/4.0, self.bounds.size.width/2.0, self.bounds.size.height/2.0);
        
        _circleView = [[HHZCircleAlphaView alloc] init];
        [_circleView changeAroundColor:[UIColor whiteColor]];
        _circleView.frame = _imgView.frame;
        
        [self addSubview:_imgView];
        [self addSubview:_circleView];
    }
    return _imgView;
}

-(UILabel *)label
{
    if (!_label)
    {
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake(0, 3 * self.bounds.size.height/4.0 + 5, self.bounds.size.width, 20);
        _label.font = [UIFont systemFontOfSize:13.0f];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor darkTextColor];
        [self addSubview:_label];
    }
    return _label;
}

-(void)changeCellModelValue:(HHZCollectionViewCellModel1 *)model
{
    self.model = model;
    self.label.text = self.model.title;
    if (self.model.isUrl)
    {
        
    }
    else
    {
        
        self.imgView.image = [UIImage imageNamed:self.model.image];
    }
}

@end
