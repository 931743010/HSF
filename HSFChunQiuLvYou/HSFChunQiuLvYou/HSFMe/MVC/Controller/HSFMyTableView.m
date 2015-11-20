//
//  HSFMyTableView.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFMyTableView.h"
#import "Abbreviation.h"
#import "HSFMyTabelViewCell.h"

#import "HSFMyTool.h"
#import "HSFTabelCell.h"
@interface HSFMyTableView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) int rowNumber;

@end

static NSString *Identifier = @"MyCell";
@implementation HSFMyTableView
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LScreenWidth, LScreenHeight - 150 - 49) style:UITableViewStyleGrouped];
}
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        UINib *nib = [UINib nibWithNibName:@"HSFMyTabelViewCell" bundle:nil];
        [self.tableView registerNib:nib forCellReuseIdentifier:Identifier];
        
        [self addSubview:self.tableView];
        self.rowNumber = 0;
    }
    return self;
}

#pragma mark- ---UITableViewDataSource/UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 4;
            break;
        case 3:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HSFMyTabelViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
     NSArray *cellArray = [HSFMyTool myTabelCell];
    NSInteger rouNumber = indexPath.row;
    switch (indexPath.section) {
        case 0:
            break;
        case 1:
            rouNumber += 2;
            break;
        case 2:
            rouNumber += 6;
            break;
        case 3:
            rouNumber += 10;
            break;
        default:
            break;
    }
    HSFTabelCell *tabelCell = cellArray[rouNumber];
    cell.iamgeName.image = [UIImage imageNamed:tabelCell.imageName];
    cell.name.text = tabelCell.name;




    return cell;
}


@end
