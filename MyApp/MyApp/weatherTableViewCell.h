//
//  weatherTableViewCell.h
//  MyApp
//
//  Created by Alan on 15/12/8.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "futureModel.h"

@interface weatherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *week;

@property (weak, nonatomic) IBOutlet UILabel *temperature;

@property (weak, nonatomic) IBOutlet UILabel *weather;
@property (weak, nonatomic) IBOutlet UILabel *date_t;




@end
