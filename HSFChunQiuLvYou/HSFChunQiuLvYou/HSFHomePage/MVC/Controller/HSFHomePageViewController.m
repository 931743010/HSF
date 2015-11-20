//
//  HSFHomePageViewController.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/4.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "HSFHomePageViewController.h"
#import "Abbreviation.h"
#import "UIColor+MyColor.h"


//首页
#import "HSFHeadScrollView.h"
#import "HSFHomePageTool.h"
#import "HSFHomePageCollectionView.h"
#import "HSFFlayTabBarController.h"

//行程服务
#import "HSFTripViewController.h"

//公告
#import "HSFNotiveViewController.h"

//我的
#import "HSFMyViewController.h"

//headScorllView的高度
static int HEADHEIGHT= 155;
static NSString * const reuseIdentifier = @"deal";

@interface HSFHomePageViewController ()<UITabBarDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

//TabBarItem
@property (weak, nonatomic) IBOutlet UITabBarItem *homeItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *serVerItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *customerServiceItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *notiveItem;
@property (weak, nonatomic) IBOutlet UITabBarItem *myItem;


//头部视图
@property (nonatomic, strong) HSFHeadScrollView *headScorllView;
@property (nonatomic, strong) HSFHomePageCollectionView *collectionView;
@property (nonatomic, strong) HSFFlayTabBarController *flayTbC;


//行程服务
@property (nonatomic, strong) HSFTripViewController *tripService;

//公告
@property (nonatomic, strong) HSFNotiveViewController *notive;

//我的
@property (nonatomic, strong) HSFMyViewController *my;

//电话
@property (nonatomic, strong) UIActionSheet *sheet;


@end

@implementation HSFHomePageViewController

- (UIActionSheet *)sheet{
    if (!_sheet) {
        _sheet = [[UIActionSheet alloc] initWithTitle:@"24小时服务热线" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拨打电话：110" otherButtonTitles:nil, nil];

    }
    return _sheet;
}
#pragma mark-  ----懒加载tripService/ tripService/ tripService
- (HSFMyViewController *)my{
    if (!_my) {
        _my = [[HSFMyViewController alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, LScreenHeight - 49)];
    }

    return _my;
}

- (HSFNotiveViewController *)notive{
    if (!_notive) {
        _notive = [[HSFNotiveViewController alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, LScreenHeight - 49)];
    }
    return _notive;
}

- (HSFTripViewController *)tripService{
    if (!_tripService) {
        _tripService = [[HSFTripViewController alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, LScreenHeight - 49)];
    }
    return _tripService;
}


#pragma mark-  ----懒加载HomePage
- (HSFFlayTabBarController *)flayTbC{
    if (!_flayTbC) {
        _flayTbC = [[HSFFlayTabBarController alloc]init];
    }
    return _flayTbC;
}

- (HSFHomePageCollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLay = [[UICollectionViewFlowLayout alloc]init];
        [flowLay setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[HSFHomePageCollectionView alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, LScreenHeight - 49) collectionViewLayout:flowLay];
    }
    return _collectionView;
}

- (HSFHeadScrollView *)headScorllView{
    if (!_headScorllView) {
        _headScorllView = [[HSFHeadScrollView alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, HEADHEIGHT)];
    }
    return _headScorllView;
}


#pragma mark- ---viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];

     self.edgesForExtendedLayout = UIRectEdgeNone;
    self.collectionView.headScrollView = self.headScorllView;
    self.collectionView.navigationController = self.navigationController;
    [self.view addSubview:self.collectionView];
    self.tabBar.delegate = self;
    self.tabBar.selectedItem = self.homeItem;
    self.tabBar.barTintColor = [UIColor getColor:@"006400"];
    
//tabBarIteme tag赋值
    self.homeItem.tag = 1;
    self.serVerItem.tag = 2;
    self.customerServiceItem.tag = 3;
    self.notiveItem.tag = 4;
    self.myItem.tag = 5;

}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark- --- didSelectItem
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    switch (item.tag) {
        case 1:
            [self removeAllView:1];
            if ([self.view isKindOfClass:[HSFHomePageCollectionView class]]) {
                break;
            }
            [self.view addSubview:self.collectionView];
            break;
        case 2:
            [self removeAllView:2];
            if ([self.view isKindOfClass:[HSFTripViewController class]]) {
                break;
            }
            [self.view addSubview:self.tripService];
            break;
        case 3:
            [self.sheet showInView:self.view];
            break;
        case 4:
            [self removeAllView:4];
            if ([self.view isKindOfClass:[HSFNotiveViewController class]]) {
                break;
            }
            [self.view addSubview:self.notive];
            break;
        case 5:
            [self removeAllView:5];
            if ([self.view isKindOfClass:[HSFMyViewController class]]) {
                break;
            }
            [self.view addSubview:self.my];
            break;
        default:
            break;
    }

}

- (void)removeAllView:(int)number{
    switch (number) {
        case 1:
            [self.tripService removeFromSuperview];
            [self.notive removeFromSuperview];
            [self.my removeFromSuperview];
            break;
        case 2:
            [self.collectionView removeFromSuperview];
            [self.notive removeFromSuperview];
            [self.my removeFromSuperview];
            break;
        case 4:
            [self.collectionView removeFromSuperview];
            [self.tripService removeFromSuperview];
            [self.my removeFromSuperview];
            break;
        case 5:
            [self.collectionView removeFromSuperview];
            [self.tripService removeFromSuperview];
            [self.notive removeFromSuperview];
            break;
        default:
            break;
    }
}



@end
