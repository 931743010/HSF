//
//  HSFHomePageCollectionView.h
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/5.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HSFHeadScrollView;

@interface HSFHomePageCollectionView : UICollectionView

@property (nonatomic, strong) HSFHeadScrollView *headScrollView;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UITabBarController *tabBarController;


@end
