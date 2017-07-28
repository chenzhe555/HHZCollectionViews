//
//  ViewController.m
//  HHZCollectionViews
//
//  Created by 仁和Mac on 2017/7/28.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "ViewController.h"
#import "HHZCollectionViewCellModel1.h"
#import "HHZChooseUnusedCV.h"
#import "HHZCommonCollectionView.h"

@interface ViewController ()<HHZCollectionViewDelegate>
@property (nonatomic, strong) HHZCommonCollectionView * chooseCV;
@property (nonatomic, strong) HHZChooseUnusedCV * unUsedVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.chooseCV = [[HHZCommonCollectionView alloc] init];
    self.chooseCV.frame = self.view.bounds;
    self.chooseCV.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.chooseCV];
    
    self.unUsedVC = [[HHZChooseUnusedCV alloc] init];
    self.unUsedVC.frame = self.view.bounds;
    self.unUsedVC.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.unUsedVC];
    
    
    HHZCollectionViewCellModel1 * model1 = [HHZCollectionViewCellModel1 generateModelTitle:@"考勤" Image:@"1.jpg" isUrl:NO];
    HHZCollectionViewCellModel1 * model2 = [HHZCollectionViewCellModel1 generateModelTitle:@"龙虎榜" Image:@"2.png" isUrl:NO];
    HHZCollectionViewCellModel1 * model3 = [HHZCollectionViewCellModel1 generateModelTitle:@"审批" Image:@"3.jpg" isUrl:NO];
    HHZCollectionViewCellModel1 * model4 = [HHZCollectionViewCellModel1 generateModelTitle:@"仁和社区" Image:@"4.jpg" isUrl:NO];
    HHZCollectionViewCellModel1 * model5 = [HHZCollectionViewCellModel1 generateModelTitle:@"董事长邮箱" Image:@"5.jpg" isUrl:NO];
    HHZCollectionViewCellModel1 * model6 = [HHZCollectionViewCellModel1 generateModelTitle:@"分享传播" Image:@"6.jpg" isUrl:NO];
    HHZCollectionViewCellModel1 * model7 = [HHZCollectionViewCellModel1 generateModelTitle:@"积分中心" Image:@"7.jpg" isUrl:NO];
    HHZCollectionViewCellModel1 * model8 = [HHZCollectionViewCellModel1 generateModelTitle:@"会议" Image:@"8.jpg" isUrl:NO];
    HHZCollectionViewCellModel1 * model9 = [HHZCollectionViewCellModel1 generateModelTitle:@"通知广告" Image:@"9.jpg" isUrl:NO];
    
    NSArray * arr1 = @[model1,model2,model3,model4,model5,model6,model7,model8,model9];
    NSArray * arr2 = @[model1,model2,model3,model4,model5];
    NSArray * arr3 = @[model6,model7,model8,model9];
    
    [self.chooseCV configInfoArr:arr1];
    [self.chooseCV initializeViewsDelegate:self];
    
//    [self.unUsedVC configInUsedInfos:arr2];
//    [self.unUsedVC configUnUsedInfos:arr3];
//    [self.unUsedVC initializeViewsDelegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
