//
//  HSFMyViewController.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFMyViewController.h"
#import "Abbreviation.h"
#import "UIColor+MyColor.h"
#import "HSFMyTableView.h"

@interface HSFMyViewController ()
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) HSFMyTableView *tableView;

@end
static int HEADWEIGHT = 150;
static int TABEBARHEIGHT = 49;




@implementation HSFMyViewController
- (HSFMyTableView *)tableView{
    if (!_tableView) {
        _tableView = [[HSFMyTableView alloc]initWithFrame:CGRectMake(0, HEADWEIGHT, LScreenWidth, LScreenHeight - HEADWEIGHT - TABEBARHEIGHT)];
    }
    return _tableView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor purpleColor];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HSFMyTableView" owner:self options:nil];
        UIView *tempMyView = [nib objectAtIndex:0];
        tempMyView.frame = CGRectMake(0, 0, LScreenWidth, HEADWEIGHT);
        [self addSubview:tempMyView];
        [self addSubview:self.tableView];
    }
    return self;
}

@end
