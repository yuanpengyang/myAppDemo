//
//  futureModel.m
//  MyApp
//
//  Created by Alan on 15/12/8.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "futureModel.h"

@implementation futureModel

- (NSDictionary*)attributeMapDictionary{
    
    //   @"属性名": @"数据字典的key"
    NSDictionary *mapAtt = @{
                             @"date":@"date",
                             @"week":@"week",
                             @"weather":@"weather",
                             @"temperature":@"temperature"
                             };
    
    return mapAtt;
}


@end
