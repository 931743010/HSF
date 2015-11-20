//
//  LHSFlayTabBarController.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFFlayTabBarController.h"
#import "HSFFlayViewController.h"
#import "UIColor+MyColor.h"

@implementation HSFFlayTabBarController
- (instancetype)init
{
    self = [super init];
    if (self) {
        HSFFlayViewController *flayC = [HSFFlayViewController new];
            NSDate *  senddate=[NSDate date];
        
            NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
        
            [dateformatter setDateFormat:@"YYYY-MM-dd"];
            
            NSString *  locationString=[dateformatter stringFromDate:senddate];
        flayC.nowTime = locationString;

        flayC.tabBarItem.image = [UIImage imageNamed:@"B-b"];
        flayC.tabBarItem.selectedImage =[UIImage imageNamed:@"B-b"];
        
        
        UIViewController *view = [[UIViewController alloc]init];
        view.tabBarItem.title = @"航班动态";
        view.tabBarItem.image = [UIImage imageNamed:@"B-c"];
        view.tabBarItem.selectedImage = [UIImage imageNamed:@"B-c"];
        
        
        UIViewController *view2 = [[UIViewController alloc]init];
        view2.tabBarItem.title = @"机场助手";
        view2.tabBarItem.image = [UIImage imageNamed:@"B-d"];
        
        view2.tabBarItem.selectedImage = [UIImage imageNamed:@"B-d"];
        
        
        [self addChildViewController:flayC];
        [self addChildViewController:view];
        [self addChildViewController:view2];
        self.tabBar.barTintColor = [UIColor getColor:@"006400"];

    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
@end
