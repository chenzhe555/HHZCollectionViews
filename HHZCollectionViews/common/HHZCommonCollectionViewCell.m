//
//  HHZCommonCollectionViewCell.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCommonCollectionViewCell.h"
#import "HHZCollectionViewCellModel1.h"
#import <HHZCategory/UIView+HHZCategory.h>
#import "HHZCircleTool.h"

#define kImageAndTextSpace 10

@interface HHZCommonCollectionViewCell ()
@property (nonatomic, strong) UIImageView * imgView;
@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) HHZCollectionViewCellModel1 * model;
@end

@implementation HHZCommonCollectionViewCell
+(HHZCommonCollectionViewCell *)generateCollectionViewCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath infoArray:(NSMutableArray *)infoArr
{
    static NSString * cellIndentifier = @"HHZCommonCollectionViewCellIndentifier";
    HHZCommonCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    [cell changeCellModelValue:infoArr[indexPath.row]];
    return cell;
}

-(UIImageView *)imgView
{
    if (!_imgView)
    {
        _imgView = [[UIImageView alloc] init];
        _imgView.frame = CGRectMake(self.bounds.size.width/4.0, self.bounds.size.height/4.0, self.bounds.size.width/2.0, self.bounds.size.height/2.0);

        [self addSubview:_imgView];
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

-(void)changeCellMoveState:(BOOL)isMoving
{
    if (isMoving)
    {
        self.imgView.hidden = YES;
        self.label.hidden = YES;
    }
    else
    {
        self.imgView.hidden = NO;
        self.label.hidden = NO;
    }
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
        UIImage * img = [UIImage imageNamed:self.model.image];
        if (self.model.imageIsCircle) img = [HHZCircleTool getImageRadius:img.size.width/2 andImage:img];
        
        self.imgView.image = img;
        self.imgView.frame = CGRectMake((self.width - img.size.width)/2, (self.height - img.size.height - self.label.height - kImageAndTextSpace)/2, img.size.width, img.size.height);
        self.label.frame = CGRectMake((self.width - self.label.width)/2, self.imgView.yPlushHeight + kImageAndTextSpace, self.label.width, self.label.height);
    }
}

-(HHZCollectionViewCellModel1 *)getCellModel
{
    return self.model;
}

@end

