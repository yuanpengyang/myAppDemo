//
//  DetialTableViewController.h
//  MyApp
//
//  Created by Alan on 15/12/16.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
//#import "AddGroupTableView.h"

@interface AddGroupViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, SWTableViewCellDelegate>
{
    
   // NSMutableArray *_testArray;
    UITextField *textfield;
    
}

@property (nonatomic, strong) UITableView *addgroupTable;

@end
