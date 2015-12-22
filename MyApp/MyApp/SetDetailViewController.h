//
//  SetDetailViewController.h
//  MyApp
//
//  Created by Alan on 15/12/17.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PriorityHeadView.h"
#import "RemindTimeTableViewCell.h"
#import "SetRemindTimeViewController.h"
#import "RepeatTableViewCell.h"

@interface SetDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{

    UITextView *foottextView;
    BOOL    _up;
    UISwitch *dateswitch;
    UISwitch *locationswitch;
    NSString *remindtime;
    NSString *repeat;
   
}


@property (nonatomic, strong)NSString *detailName;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSString *groupName;

@end
