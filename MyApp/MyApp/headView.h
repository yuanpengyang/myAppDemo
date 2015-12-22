//
//  headView.h
//  MyApp
//
//  Created by Alan on 15/12/8.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weatherModel.h"
#import "weatherLayoutFram.h"


//@class weatherLayoutFram;

@interface headView : UIView


@property (nonatomic,strong) UILabel *city; //城市

@property (nonatomic,strong) UILabel *date_y; // 日期

@property (nonatomic,strong) UILabel *week;   //星期

@property (nonatomic,strong) UILabel *wind;   //风向

@property (nonatomic,strong) UILabel *temperature; //温度

@property (nonatomic,strong) weatherModel *todaymodel;

@property (nonatomic,strong) weatherLayoutFram *layoutfram;

@end
