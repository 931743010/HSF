//
//  HSFCityGroupViewController.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFCityGroupViewController.h"
#import "HSFHomePageTool.h"
#import "HSFCity.h"

@interface HSFCityGroupViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *cityGroupArray;

@end
static NSString *Identifier = @"MyCell";
@implementation HSFCityGroupViewController
- (NSArray *)cityGroupArray{
    if (!_cityGroupArray) {
        _cityGroupArray = [HSFHomePageTool cityGroup];
    }
    return _cityGroupArray;
}
- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.titleLabel.text = self.title;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UITableViewDelegate/UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cityGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HSFCity *city = self.cityGroupArray[section];
    return city.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    HSFCity *city = self.cityGroupArray[indexPath.section];
    cell.textLabel.text = city.cities[indexPath.row];
    return cell;
}
//设置section的头部title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    HSFCity *cityGroup = self.cityGroupArray[section];
    return cityGroup.title;
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    //方式一：循环把self.cityGroupsArray中每个对象的title属性组成一个数组返回
    //方式二：使用valueForKeypath方法
    return [self.cityGroupArray valueForKeyPath:@"title"];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //获取用户选中的城市组对应的模型对象
    if ([self.title isEqualToString:@"出发城市"]) {
        HSFCity *cityGroup = self.cityGroupArray[indexPath.section];
        NSString *cityName = cityGroup.cities[indexPath.row];
        //发送通知给区域视图控制器(城市的名字)
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GoCity" object:self userInfo:@{@"CityName" : cityName}];
        [self.navigationController popViewControllerAnimated:YES];
    }
    if ([self.title isEqualToString:@"到达城市"]) {
        HSFCity *cityGroup = self.cityGroupArray[indexPath.section];
        NSString *cityName = cityGroup.cities[indexPath.row];
        //发送通知给区域视图控制器(城市的名字)
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BackCity" object:self userInfo:@{@"CityName" : cityName}];
        [self.navigationController popViewControllerAnimated:YES];
    }
}



@end
