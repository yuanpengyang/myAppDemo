//
//  DetialTableViewController.h
//  MyApp
//
//  Created by Alan on 15/12/16.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
#import "AddDetailViewController.h"
#import "SetDetailViewController.h"
#import "SetDetailNavController.h"

@interface DetialViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, SWTableViewCellDelegate>{
    
    NSMutableArray *groupArray;
   // UITextField *textfield;
    UIButton *titleButton;
    NSMutableArray *detailArray;

}

@property (nonatomic, assign)NSInteger index;
@property (nonatomic, strong)UITableView *detailTableView;

@end
