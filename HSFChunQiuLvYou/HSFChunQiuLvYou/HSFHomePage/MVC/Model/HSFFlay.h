//
//  HSFFlay.h
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSFFlay : NSObject
@property (nonatomic, strong) NSArray *value;
@property (nonatomic, strong) NSDictionary *extInfo;

+ (HSFFlay *)flay:(NSDictionary*)dic;
@end
