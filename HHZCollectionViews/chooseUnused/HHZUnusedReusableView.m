//
//  HHZUnusedReusableView.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZUnusedReusableView.h"

#define HHZUnusedReusableViewSpace 15.0f
#define HHZUnusedReusableViewSpaceLabelWidth 150.0f

@interface HHZUnusedReusableView ()
@property (nonatomic, strong) UILabel * leftLabel;
@property (nonatomic, strong) UILabel * rightLabel;
@end

@implementation HHZUnusedReusableView
+(HHZUnusedReusableView *)getReuseableView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle
{
    static NSString * cellHeaderViewIndentifier = @"cellHeaderViewIndentifier";
    HHZUnusedReusableView * headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellHeaderViewIndentifier forIndexPath:indexPath];
    [headView createReuseableViewLeftTitle:leftTitle rightTitle:rightTitle];
    return headView;
}

-(void)createReuseableViewLeftTitle:leftTitle rightTitle:rightTitle
{
    if (!self.leftLabel || self.rightLabel) {
        self.leftLabel = [[UILabel alloc] init];
        self.leftLabel.frame = CGRectMake(HHZUnusedReusableViewSpace, 0, HHZUnusedReusableViewSpaceLabelWidth, self.bounds.size.height);
        self.leftLabel.textAlignment = NSTextAlignmentLeft;
        self.leftLabel.textColor = [UIColor darkGrayColor];
        self.leftLabel.font = [UIFont systemFontOfSize:13.0f];
        [self addSubview:self.leftLabel];
        
        self.rightLabel = [[UILabel alloc] init];
        self.rightLabel.frame = CGRectMake((self.bounds.size.width - HHZUnusedReusableViewSpace - HHZUnusedReusableViewSpaceLabelWidth),0, HHZUnusedReusableViewSpaceLabelWidth, self.bounds.size.height);
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        self.rightLabel.textColor = [UIColor lightGrayColor];
        self.rightLabel.font = [UIFont systemFontOfSize:11.0f];
        [self addSubview:self.rightLabel];
    }
    self.leftLabel.text = leftTitle;
    self.rightLabel.text = rightTitle;
}
@end
