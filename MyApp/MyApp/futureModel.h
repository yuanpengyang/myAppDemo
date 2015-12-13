//
//  futureModel.h
//  MyApp
//
//  Created by Alan on 15/12/8.
//  Copyright © 2015年 Abel. All rights reserved.
//


#import "BaseModel.h"

@interface futureModel : BaseModel

@property (nonatomic, copy) NSString *week;

@property (nonatomic, copy) NSString *temperature;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, copy) NSString *date;

@end
