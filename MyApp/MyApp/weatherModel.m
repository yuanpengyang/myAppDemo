//
//  weatherModel.m
//  MyApp
//
//  Created by Alan on 15/12/8.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "weatherModel.h"

@implementation weatherModel

- (NSDictionary*)attributeMapDictionary{
    
    //   @"属性名": @"数据字典的key"
    NSDictionary *mapAtt = @{
                             @"city":@"city",
                             @"date_y":@"date_y",
                             @"week":@"week",
                             @"wind":@"wind",
                             @"temperature":@"temperature"
                             };
    
    return mapAtt;
}




@end
