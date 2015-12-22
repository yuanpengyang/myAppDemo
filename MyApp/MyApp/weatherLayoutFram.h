//
//  weatherLayoutFram.h
//  MyApp
//
//  Created by Alan on 15/12/15.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "weatherModel.h"
#import "futureModel.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface weatherLayoutFram : NSObject

@property (nonatomic, strong)weatherModel *weathermodel;
@property (nonatomic, strong)futureModel  *futuremodel;


@property (nonatomic,assign) CGRect cityFram; //城市

@property (nonatomic,assign) CGRect date_yFram; // 日期

@property (nonatomic,assign) CGRect weekFram;   //星期

@property (nonatomic,assign) CGRect windFram;   //风向

@property (nonatomic,assign) CGRect temperatureFram; //温度

@end
