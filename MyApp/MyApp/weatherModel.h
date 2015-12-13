//
//  weatherModel.h
//  MyApp
//
//  Created by Alan on 15/12/8.
//  Copyright © 2015年 Abel. All rights reserved.
//

//  city wind风 week dressing_index较冷 temperature
#import "BaseModel.h"

@interface weatherModel : BaseModel


@property (nonatomic,copy) NSString *city; //城市

@property (nonatomic,copy) NSString *date_y; // 日期

@property (nonatomic,copy) NSString *week;   //星期

@property (nonatomic,copy) NSString *wind;   //风向

@property (nonatomic,copy) NSString *temperature; //温度




@end
