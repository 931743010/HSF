//
//  HSFFlaytoCityViewController.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFFlaytoCityViewController.h"
#import "Abbreviation.h"
#import "HSFFlayPageCell.h"
#import "HSFFlay.h"

@interface HSFFlaytoCityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (nonatomic, strong) UITableView *tableView;

@end


static NSString *Identifier = @"MyCell";
@implementation HSFFlaytoCityViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, LScreenWidth, LScreenHeight - 64) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController
    self.titleLable.text = self.title;
    UINib *nib = [UINib nibWithNibName:@"HSFFlayPageCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:Identifier];
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HSFFlayPageCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[HSFFlayPageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    HSFFlay *flay = self.flay;
    cell.fromCity.text = flay.value.firstObject[1];
    cell.toCity.text = flay.value.lastObject[1];
    
    cell.fromTime.text = flay.value.firstObject[4];
    cell.toTime.text = flay.value.lastObject[3];
    
    cell.timer.text = flay.extInfo[@"intervalTime"];
    cell.day.text = flay.value.lastObject[2];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

@end
