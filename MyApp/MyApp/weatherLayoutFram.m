//
//  weatherLayoutFram.m
//  MyApp
//
//  Created by Alan on 15/12/15.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "weatherLayoutFram.h"

@implementation weatherLayoutFram




- (void)setWeathermodel:(weatherModel *)weathermodel{

   
    
    if (_weathermodel != weathermodel) {
            _weathermodel = weathermodel;
            [self layoutFram];
        }
    


}

//    self.city        = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 50)];
//    self.week        = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, 100, 50)];
//    self.temperature = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, 100, 50)];
//    self.wind        = [[UILabel alloc]initWithFrame:CGRectMake(0, 170, 200, 50)];
//    self.date_y      = [[UILabel alloc]initWithFrame:CGRectMake(0, 220, 200, 50)];

- (void)layoutFram{

    NSString *strcity = self.weathermodel.city;
    CGSize maxSize = CGSizeMake(MAXFLOAT, 40);
    CGSize citySize = [self labelAutoCalculateRectWith:strcity FontSize:15.0f MaxSize:maxSize];
    CGRect cityfram = CGRectMake(0, 20, citySize.width*2, citySize.height);
    self.cityFram = cityfram;
    
    NSString *strweek = self.weathermodel.week;
    CGSize weekSize = [self labelAutoCalculateRectWith:strweek FontSize:15.0f MaxSize:maxSize];
    CGRect weekfram = CGRectMake(0, 70, weekSize.width*2, weekSize.height);
    self.weekFram = weekfram;
    
    NSString *strtemperature = self.weathermodel.temperature;
    CGSize temperatureSize = [self labelAutoCalculateRectWith:strtemperature FontSize:15.0f MaxSize:maxSize];
    CGRect temperaturefram = CGRectMake(0, 120, temperatureSize.width*2, temperatureSize.height);
    self.temperatureFram = temperaturefram;

    NSString *strwind = self.weathermodel.wind;
    CGSize windSize = [self labelAutoCalculateRectWith:strwind FontSize:15.0f MaxSize:maxSize];
    CGRect windfram = CGRectMake(0, 170, windSize.width*2, windSize.height);
    self.windFram = windfram;
    
    NSString *strdate_y = self.weathermodel.date_y;
    CGSize date_ySize = [self labelAutoCalculateRectWith:strdate_y FontSize:15.0f MaxSize:maxSize];
    CGRect date_yfram = CGRectMake(0, 220, date_ySize.width*2, date_ySize.height);
    self.date_yFram = date_yfram;
}

//得到text size
- (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize
{
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    //如果系统为iOS7.0；
    CGSize labelSize;
    if (![text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
        labelSize = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
    }
    //如果是IOS6.0
    　else
        　　{
            labelSize = [text boundingRectWithSize: maxSize
                                           options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine
                                        attributes:attributes
                                           context:nil].size;
        }
    labelSize.height=ceil(labelSize.height);
    labelSize.width=ceil(labelSize.width);
    return labelSize;
}

@end
