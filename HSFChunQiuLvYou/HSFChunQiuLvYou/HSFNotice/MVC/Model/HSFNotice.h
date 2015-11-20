//
//  HSFNotice.h
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSFNotice : NSObject
@property (nonatomic, strong) NSString *ct;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *title;


+ (HSFNotice *)notices:(NSDictionary*)dic;
@end
