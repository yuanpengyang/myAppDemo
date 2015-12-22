//
//  headView.m
//  MyApp
//
//  Created by Alan on 15/12/8.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "headView.h"

@implementation headView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createView];
    }
    return self;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    self.city.frame = self.layoutfram.cityFram;
    self.week.frame = self.layoutfram.weekFram;
    self.temperature.frame = self.layoutfram.temperatureFram;
    self.wind.frame = self.layoutfram.windFram;
    self.date_y.frame = self.layoutfram.date_yFram;
    
    
    
    self.city.text        = self.todaymodel.city;
    self.week.text        = self.todaymodel.week;
    self.temperature.text = self.todaymodel.temperature;
    self.wind.text        = self.todaymodel.wind;
    self.date_y.text      = self.todaymodel.date_y;
    
    
    
    


}


- (void)dateChange:(NSNotification*)nofica{
    self.layoutfram = [nofica.userInfo objectForKey:@"today"];
    
    [self setNeedsLayout];
    
    self.todaymodel = self.layoutfram.weathermodel;
   
    self.city.text        = self.todaymodel.city;
    self.week.text        = self.todaymodel.week;
    self.temperature.text = self.todaymodel.temperature;
    self.wind.text        = self.todaymodel.wind;
    self.date_y.text      = self.todaymodel.date_y;



}





- (void)_createView{

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dateChange:) name:@"today" object:nil];
    
    
//    self.city        = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 50)];
//    self.week        = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, 100, 50)];
//    self.temperature = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, 100, 50)];
//    self.wind        = [[UILabel alloc]initWithFrame:CGRectMake(0, 170, 200, 50)];
//    self.date_y      = [[UILabel alloc]initWithFrame:CGRectMake(0, 220, 200, 50)];
    
    self.city        = [[UILabel alloc]initWithFrame:CGRectZero];
    self.week        = [[UILabel alloc]initWithFrame:CGRectZero];
    self.temperature = [[UILabel alloc]initWithFrame:CGRectZero];
    self.wind        = [[UILabel alloc]initWithFrame:CGRectZero];
    self.date_y      = [[UILabel alloc]initWithFrame:CGRectZero];
    
    [self addSubview:self.city];
    [self addSubview:self.week];
    [self addSubview:self.temperature];
    [self addSubview:self.wind];
    [self addSubview:self.date_y];
    
//    self.city.text        = self.todaymodel.city;
//    self.week.text        = self.todaymodel.week;
//    self.temperature.text = self.todaymodel.temperature;
//    self.wind.text        = self.todaymodel.wind;
//    self.date_y.text      = self.todaymodel.date_y;
}

@end
