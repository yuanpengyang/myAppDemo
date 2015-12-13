//
//  FirstViewController.h
//  MyApp
//
//  Created by Alan on 15/12/2.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"
@interface FirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tabView;
@property (nonatomic, strong)NSMutableArray *noteArray;
@property (nonatomic, strong)NSMutableArray *dateArray;

@property (nonatomic, strong)UIImageView    *imageView;

@end
