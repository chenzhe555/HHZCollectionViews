//
//  HHZUnusedReusableView.h
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/27.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHZUnusedReusableView : UICollectionReusableView
+(HHZUnusedReusableView *)getReuseableView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;
@end
