//
//  ThirdViewController.h
//  MyApp
//
//  Created by Alan on 15/12/2.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MMDrawerController.h"
#import "SWTableViewCell.h"
#import "AddGroupViewController.h"
#import "GroupTableViewCell.h"
#import "DetialViewController.h"

@interface ThirdViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {

    NSMutableArray *groupArray;
}


//@property(nonatomic, strong)DetialTableViewController  *detailtableVC;
@property(nonatomic, strong)UITableView   *grouptableView;
@property(nonatomic, strong)AddGroupViewController *addGrouptableVC;

@end
