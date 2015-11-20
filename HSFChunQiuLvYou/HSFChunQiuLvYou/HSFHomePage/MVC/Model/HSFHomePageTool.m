//
//  HSFHomePageTool.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/4.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "HSFHomePageTool.h"
#import <UIKit/UIKit.h>
#import "HSFCollectionViewCell.h"
#import "HSFCity.h"
#import "HSFFlay.h"
#import "AFURLRequestSerialization.h"
#import "AFURLSessionManager.h"
@implementation HSFHomePageTool








static NSArray *_cityGroupArray = nil;
+ (NSArray *)cityGroup{
    if (!_cityGroupArray) {
        _cityGroupArray = [[self alloc]getCityGroupFromPlistFile:@"cityGroups.plist"];
    }
    
    return _cityGroupArray;
}
- (NSArray *)getCityGroupFromPlistFile:(NSString* )plistName{
    NSString *plistPaht = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    NSArray *cityGroupArray = [NSArray arrayWithContentsOfFile:plistPaht];
    NSMutableArray *cityMutableArray = [NSMutableArray array];
    for (NSDictionary *cityGroupDic in cityGroupArray) {
        HSFCity *cityGroup = [HSFCity new];
        [cityGroup setValuesForKeysWithDictionary:cityGroupDic];
        [cityMutableArray addObject:cityGroup];
    }
    return  [cityMutableArray copy];
}




+ (NSArray *)TripCellArray{
    NSMutableArray  *cellArray = [NSMutableArray array];
    
    NSString *name3 = @"航班动态";
    HSFCollectionViewCell *cell3 = [HSFCollectionViewCell new];
    cell3.imageNamge = @"dt";
    cell3.name = name3;
    [cellArray addObject:cell3];
    
    NSString *name2 = @"值机";
    HSFCollectionViewCell *cell2 = [HSFCollectionViewCell new];
    cell2.imageNamge = @"zj";
    cell2.name = name2;
    [cellArray addObject:cell2];
    
    NSString *name5 = @"机票退改";
    HSFCollectionViewCell *cell5 = [HSFCollectionViewCell new];
    cell5.imageNamge = @"tg";
    cell5.name = name5;
    [cellArray addObject:cell5];
    
    
    NSString *name = @"客票验真";
    HSFCollectionViewCell *cell = [HSFCollectionViewCell new];
    cell.imageNamge = @"FlightCheckoutIcon";
    cell.name = name;
    [cellArray addObject:cell];
    
    NSString *name1 = @"物品遗失救助";
    HSFCollectionViewCell *cell1 = [HSFCollectionViewCell new];
    cell1.imageNamge = @"goodsLoseIcon";
    cell1.name = name1;
    [cellArray addObject:cell1];
    
    return [cellArray copy];
}

+ (NSArray *)collectionViewCellArray{
    NSMutableArray  *cellArray = [NSMutableArray array];
    NSString *name1 = @"酒店";
    HSFCollectionViewCell *cell1 = [HSFCollectionViewCell new];
    cell1.imageNamge = @"jd";
    cell1.name = name1;
    [cellArray addObject:cell1];
    
    NSString *name2 = @"值机";
    HSFCollectionViewCell *cell2 = [HSFCollectionViewCell new];
    cell2.imageNamge = @"zj";
    cell2.name = name2;
    [cellArray addObject:cell2];
    
    NSString *name3 = @"航班动态";
    HSFCollectionViewCell *cell3 = [HSFCollectionViewCell new];
    cell3.imageNamge = @"dt";
    cell3.name = name3;
    [cellArray addObject:cell3];
    
    NSString *name4 = @"带泊车";
    HSFCollectionViewCell *cell4 = [HSFCollectionViewCell new];
    cell4.imageNamge = @"yc";
    cell4.name = name4;
    [cellArray addObject:cell4];
    
    NSString *name5 = @"机票退改";
    HSFCollectionViewCell *cell5 = [HSFCollectionViewCell new];
    cell5.imageNamge = @"tg";
    cell5.name = name5;
    [cellArray addObject:cell5];
    
    NSString *name6 = @"增值服务";
    HSFCollectionViewCell *cell6 = [HSFCollectionViewCell new];
    cell6.imageNamge = @"FU";
    cell6.name =name6;
    [cellArray addObject:cell6];
    
    NSString *name7 = @"全球购";
    HSFCollectionViewCell *cell7 = [HSFCollectionViewCell new];
    cell7.imageNamge = @"shop";
    cell7.name = name7;
    [cellArray addObject:cell7];
    
    NSString *name8 = @"想飞就飞-特价";
    HSFCollectionViewCell *cell8 = [HSFCollectionViewCell new];
    cell8.imageNamge = @"tj";
    cell8.name = name8;
    [cellArray addObject:cell8];
    
    NSString *name9 = @"9秒闪购";
    HSFCollectionViewCell *cell9 = [HSFCollectionViewCell new];
    cell9.imageNamge = @"9m";
    cell9.name = name9;
    [cellArray addObject:cell9];
    
    NSString *name10 = @"更多精彩";
    HSFCollectionViewCell *cell10 = [HSFCollectionViewCell new];
    cell10.imageNamge = @"gd";
    cell10.name = name10;
    [cellArray addObject:cell10];
    
    
    return [cellArray copy];
}


+ (NSArray *)headImageArray{
    
    NSString *imageSix  = @"http://media.china-sss.com/cmsstatic/2015/shuangchengji/flash_small.jpg";
    NSString *imageSeven  = @"http://media.china-sss.com/cmsstatic/2015/weektour1112/flash_small.jpg";
    NSString *image  = @"http://media.china-sss.com/cmsstatic/2015/qweidan/banner/flash_small.jpg";
    NSString *imageOne = @"http://media.china-sss.com/cmsstatic/2015/mgwgl/banner/flash_small.jpg";
    NSString *imageTwo  = @"http://media.china-sss.com/cmsstatic/2015/zerodraw/flash_small.jpg";
    NSString *imageThree  = @"http://media.china-sss.com/cmsstatic/201511101248/flash_small.jpg";
    NSString *imageFour  = @"http://media.china-sss.com/cmsstatic/2015/huaxueyou/flash_small.jpg";
    NSString *imageFive  = @"http://media.china-sss.com/cmsstatic/2015/shuangchengji/flash_small.jpg";
    NSString *imageEight  = @"http://media.china-sss.com/cmsstatic/2015/weektour1112/flash_small.jpg";
    
    return @[imageSix, imageSeven, image, imageOne, imageTwo, imageThree, imageFour, imageFive,imageEight];
    
    
}

@end
