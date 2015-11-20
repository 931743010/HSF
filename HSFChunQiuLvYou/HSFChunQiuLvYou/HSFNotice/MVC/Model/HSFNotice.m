//
//  HSFNotice.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFNotice.h"

@implementation HSFNotice
+ (HSFNotice *)notices:(NSDictionary*)dic{
    HSFNotice *notice = [HSFNotice new];
    notice.title = dic[@"title"];
    notice.text = dic[@"text"];
    notice.ct = dic[@"ct"];
    return notice;
}
@end
