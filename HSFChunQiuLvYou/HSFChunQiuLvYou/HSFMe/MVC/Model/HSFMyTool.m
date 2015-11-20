//
//  HSFMyTool.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFMyTool.h"
#import "HSFTabelCell.h"
@implementation HSFMyTool




+ (NSArray *)myTabelCell{
    NSMutableArray *cellArray = [NSMutableArray array];
    HSFTabelCell *cell  = [HSFTabelCell new];
    cell.name = @"机票订单";
    cell.imageName = @"my_ticket";
    [cellArray addObject:cell];
    
    HSFTabelCell *cell1  = [HSFTabelCell new];
    cell1.name = @"酒店订单";
    cell1.imageName = @"jd";
    [cellArray addObject:cell1];
    
    HSFTabelCell *cell2  = [HSFTabelCell new];
    cell2.name = @"乘机人信息";
    cell2.imageName = @"my_info";
    [cellArray addObject:cell2];
    
    HSFTabelCell *cell3   = [HSFTabelCell new];
    cell3.name = @"我的账户";
    cell3.imageName = @"my_account";
    [cellArray addObject:cell3];
    
    HSFTabelCell *cell4  = [HSFTabelCell new];
    cell4.name = @"我的优惠卷";
    cell4.imageName = @"my_coupons";
    [cellArray addObject:cell4];
    
    HSFTabelCell *cell5  = [HSFTabelCell new];
    cell5.name = @"信息中心";
    cell5.imageName = @"my_messages_center";
    [cellArray addObject:cell5];
    
    HSFTabelCell *cell6  = [HSFTabelCell new];
    cell6.name = @"我的预约机票";
    cell6.imageName = @"calendarNew";
    [cellArray addObject:cell6];
    
    HSFTabelCell *cell7  = [HSFTabelCell new];
    cell7.name = @"扫一扫";
    cell7.imageName = @"my_sao";
    [cellArray addObject:cell7];
    
    HSFTabelCell *cell8  = [HSFTabelCell new];
    cell8.name = @"意见反馈";
    cell8.imageName = @"my_feed";
    [cellArray addObject:cell8];
    
    HSFTabelCell *cell9  = [HSFTabelCell new];
    cell9.name = @"关于春秋客户端";
    cell9.imageName = @"my_aboutapp";
    [cellArray addObject:cell9];
    
    HSFTabelCell *cell10  = [HSFTabelCell new];
    cell10.name = @"设置";
    cell10.imageName = @"my_setting";
    [cellArray addObject:cell10];
    
    return [cellArray copy];
}
@end
