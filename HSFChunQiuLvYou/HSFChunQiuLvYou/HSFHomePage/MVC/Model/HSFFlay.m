//
//  HSFFlay.m
//  HSFChunQiuLvYou
//
//  Created by Lin on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HSFFlay.h"

@implementation HSFFlay

+ (HSFFlay *)flay:(NSDictionary*)dic{
    HSFFlay *flay = [HSFFlay new];
    flay.value = dic[@"data"][@"info"][@"value"];
    flay.extInfo = dic[@"data"][@"extInfo"];
    
    return flay;
}
@end
