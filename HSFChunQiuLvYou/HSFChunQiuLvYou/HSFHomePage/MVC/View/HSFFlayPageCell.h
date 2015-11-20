//
//  HSFFlayPageCell.h
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSFFlayPageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fromCity;
@property (weak, nonatomic) IBOutlet UILabel *toCity;
@property (weak, nonatomic) IBOutlet UILabel *fromTime;
@property (weak, nonatomic) IBOutlet UILabel *toTime;
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) IBOutlet UILabel *day;

@end
