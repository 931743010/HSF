//
//  HSFNotiveViewController.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFNotiveViewController.h"
#import "Abbreviation.h"
#import "UIColor+MyColor.h"
#import "HSFNotiveTableViewCell.h"
#import "HSFNotice.h"

//加载第三方
#import "SVProgressHUD.h"

@interface HSFNotiveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *noticeArray;

@end

static int HEADHIGHT = 64;

static int TLABLEX = 153;
static int TLABLEY = 31;
static int TLABLEWEIGHT = 68;
static int TLABLEHEIGHT = 21;

static NSString *Identifier = @"MyCell";

@implementation HSFNotiveViewController
#pragma mark ---重写initWithFrame
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        UINib *nib = [UINib nibWithNibName:@"HSFNotiveTableViewCell" bundle:nil];
        [self.tableView registerNib:nib forCellReuseIdentifier:Identifier];
        
        [SVProgressHUD showWithStatus:@"数据加载中"];
        [self getJSONData];
        [self addSubview:self.titleView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.tableView];
    }
    return self;
}

#pragma mark ---懒加载title
- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, HEADHIGHT)];
        _titleView.backgroundColor = [UIColor getColor:@"006400"];
    }
    return _titleView;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(TLABLEX, TLABLEY, TLABLEWEIGHT, TLABLEHEIGHT)];
        _titleLabel.text = @"公告";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}


#pragma mark ---懒加载tableView
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, HEADHIGHT, LScreenWidth, LScreenHeight - HEADHIGHT - 49) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor lightGrayColor];
    }
    return _tableView;
}

#pragma mark ---tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HSFNotiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[HSFNotiveTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
    HSFNotice *notice = [HSFNotice notices:self.noticeArray[indexPath.row]];
    cell.text.text = notice.title;
    cell.title.text = notice.ct;
    return cell;
}
//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

/*
//监听用户点击操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"1");
}*/



- (void)getJSONData{
    NSString *httpURL = @"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text";
    NSString *httpArg = @"page=1";
    [self request:httpURL withHttpArg:httpArg];
    
}

- (void)request:(NSString *)httpUrl withHttpArg:(NSString *)httpArg{
    NSString *urlStr = [[NSString alloc] initWithFormat:@"%@?%@",httpUrl,httpArg];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"GET"];
    [request addValue:@"ea785439914d10b0c15037b19416a8f0" forHTTPHeaderField:@"apikey"];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"Httperror:%@%ld",connectionError.localizedDescription,connectionError.code);
        }else{
            NSInteger reponseCode = [(NSHTTPURLResponse *)response statusCode];
            
            self.noticeArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil][@"showapi_res_body"][@"contentlist"];

            if (reponseCode != 200) {
                NSLog(@"请求失败:%ld",reponseCode);
                }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                NSLog(@"%@",self.noticeArray);
                
            });
        }
    }];
    
    [self.tableView reloadData];
}

@end
