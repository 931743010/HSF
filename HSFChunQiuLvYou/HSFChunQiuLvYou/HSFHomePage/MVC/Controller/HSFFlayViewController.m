//
//  HSFFlayViewController.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
// key :f4ccf172d265dbed8a53d207d08e374d

#import "HSFFlayViewController.h"
#import "Abbreviation.h"
#import "UIColor+MyColor.h"
#import "HSFCityGroupViewController.h"

#import "HSFFlay.h"
//日历第三方导入
#import "CalendarHomeViewController.h"
#import "CalendarViewController.h"
#import "Color.h"
//HTTP第三方
#import "AFHTTPRequestOperationManager.h"
#import "AFURLRequestSerialization.h"

//加载第三方
#import "SVProgressHUD.h"

//机票页面
#import "HSFFlaytoCityViewController.h"

@interface HSFFlayViewController ()<UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *oneView;

@property (weak, nonatomic) IBOutlet UIView *doubleView;
@property (weak, nonatomic) IBOutlet UILabel *teday;
@property (weak, nonatomic) IBOutlet UITabBarItem *FirstItem;
@property (weak, nonatomic) IBOutlet UITabBar *ftableBar;
@property (nonatomic, strong) UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIButton *goCity;
@property (weak, nonatomic) IBOutlet UIButton *backCity;
@property (weak, nonatomic) IBOutlet UIButton *goTimer;

@property (weak, nonatomic) IBOutlet UILabel *teday2r;
@property (weak, nonatomic) IBOutlet UILabel *teday3t;
@property (weak, nonatomic) IBOutlet UIButton *gotimer2r;
@property (weak, nonatomic) IBOutlet UIButton *gotimer3t;
@property (nonatomic, strong) HSFFlay *flay;


//日历对象
@property (nonatomic, strong) CalendarHomeViewController *chvc;

@end


static NSInteger SEGMENTY = 64;
@implementation HSFFlayViewController

- (UISegmentedControl *)segment{
    if (!_segment) {
        _segment = [[UISegmentedControl alloc]initWithItems:@[@"单程",@"往返"]];
        _segment.frame = CGRectMake(0, SEGMENTY, LScreenWidth, 40);
        _segment.selectedSegmentIndex = 0;
        [_segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
        //_segment.tintColor = [UIColor clearColor];
    }
    return _segment;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showTabBar:self.tabBarController];
}
//返回按钮
- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)BackLabelText:(NSNotification *)notification{
    
    self.backCity.titleLabel.text = notification.userInfo[@"CityName"];
}


- (IBAction)clickGoCity:(UIButton *)sender {
    HSFCityGroupViewController *cityView = [HSFCityGroupViewController new];
    [self hideTabBar:self.tabBarController];
    cityView.title = @"出发城市";
    [self.navigationController pushViewController:cityView animated:YES];
}
- (void)goLabelText:(NSNotification *)notification{
    self.goCity.titleLabel.text = notification.userInfo[@"CityName"];
}


- (IBAction)clickBackCity:(UIButton *)sender {
    HSFCityGroupViewController *cityView = [HSFCityGroupViewController new];
    [self hideTabBar:self.tabBarController];
    cityView.title = @"到达城市";
    [self.navigationController pushViewController:cityView animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"机票预订";
    //[self.navigationController setNavigationBarHidden:NO];
    //self.navigationController
    [self.view addSubview:self.segment];
    self.ftableBar.barTintColor = [UIColor getColor:@"006400"];
    self.ftableBar.selectedItem = self.FirstItem;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goLabelText:) name:@"GoCity" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BackLabelText:) name:@"BackCity" object:nil];
    [self.goTimer setTitle:self.nowTime forState:UIControlStateNormal];
    self.teday2r.text = self.teday.text;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
#pragma mark- ---显示和隐藏tabbar
- (void)hideTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(0, 667, LScreenWidth, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(0, view.frame.origin.y, LScreenWidth, 667)];
        }
    }
    
    [UIView commitAnimations];
}

- (void)showTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(0, 667 - 49, LScreenWidth, view.frame.size.height)];
            
        }
        else
        {
            [view setFrame:CGRectMake(0, view.frame.origin.y, LScreenWidth, 431)];
        }
    }
    
    [UIView commitAnimations];
}


#pragma mark- ---点击日期
- (IBAction)goTimer:(UIButton *)sender {
    if (!self.chvc) {
        
        self.chvc = [[CalendarHomeViewController alloc]init];
        
        self.chvc.calendartitle = @"日历";
        
        [self.chvc setAirPlaneToDay:365 ToDateforString:nil];//飞机初始化方法
        
    }
    __weak UIButton *buttom = self.goTimer;
    __weak UIButton *buttom2r = self.gotimer2r;
       __weak UILabel *teday = self.teday;
    __weak UILabel *teday2r = self.teday2r;
    
    self.chvc.calendarblock = ^(CalendarDayModel *model){

        if (model.holiday) {
            
            [buttom setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
            [buttom2r setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
            teday.text = [model getWeek];
            teday2r.text = [model getWeek];
        }else{
            
            [buttom setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
            [buttom2r setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
            teday.text = [model getWeek];
            teday2r.text = [model getWeek];
        }
    };
    
    [self.navigationController pushViewController:self.chvc animated:YES];
}
- (IBAction)backclick:(UIButton *)sender {
    if (!self.chvc) {
        
        self.chvc = [[CalendarHomeViewController alloc]init];
        
        self.chvc.calendartitle = @"飞机";
        
        [self.chvc setAirPlaneToDay:365 ToDateforString:nil];//飞机初始化方法
        
    }

    __weak UILabel *teday = self.teday3t;

    
    self.chvc.calendarblock = ^(CalendarDayModel *model){
        if (model.holiday) {
            
            [sender setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
            teday.text = [model getWeek];

        }else{
            
            [sender setTitle:[NSString stringWithFormat:@"%@",[model toString]] forState:UIControlStateNormal];
            teday.text = [model getWeek];
        }
    };
    
    [self.navigationController pushViewController:self.chvc animated:YES];
}


- (void)segmentChange:(UISegmentedControl* )sender{
    NSInteger segemtIndex = sender.selectedSegmentIndex;
    if (segemtIndex == 0) {
        self.oneView.hidden = NO;
        self.doubleView.hidden = YES;
    }
    if (segemtIndex == 1) {
        self.oneView.hidden = YES;
        self.doubleView.hidden = NO;
    }
}



#pragma mark- ---点击查询按钮
- (IBAction)clickEnquiries:(UIButton *)sender {
   
    NSString *httpUrl = @"http://apis.baidu.com/qunar/qunar_train_service/traindetail";
    NSString *httpArg = @"version=1.0&train=G101&from=%E5%8C%97%E4%BA%AC%E5%8D%97&to=%E4%B8%8A%E6%B5%B7%E8%99%B9%E6%A1%A5&date=2015-09-01";
    [SVProgressHUD showWithStatus:@"数据加载中"];
    [self request: httpUrl withHttpArg: httpArg];
    
}


-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"f4ccf172d265dbed8a53d207d08e374d" forHTTPHeaderField: @"apikey"];
    
    NSLog(@"%@", [request.URL absoluteString]);
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
            if (error) {
                [SVProgressHUD dismiss];
                NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
            } else {
                    NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                NSDictionary *dic = [NSDictionary dictionary];
                dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                self.flay = [HSFFlay flay:dic];
                    [SVProgressHUD dismiss];
                HSFFlaytoCityViewController *flayCityView = [HSFFlaytoCityViewController new];
                flayCityView.title =  [NSString stringWithFormat:@"%@->%@",self.goCity.titleLabel.text, self.backCity.titleLabel.text];
                flayCityView.flay = self.flay;
                    [self.navigationController pushViewController:flayCityView animated:YES];
                    NSLog(@"HttpResponseCode:%ld", responseCode);
                    NSLog(@"HttpResponseBody %@",responseString);
                }
    }];

}

@end
