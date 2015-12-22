//
//  SecondViewController.h
//  MyApp
//
//  Created by Alan on 15/12/2.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "weatherTableViewCell.h"
#import "headView.h"
#import "futureModel.h"
#import "getKeyMethod.h"
#import "CityViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "weatherLayoutFram.h"
@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{

    headView *headview;
    UIButton *cityBtn;
   

}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) weatherModel *weakmodel;

//@property (nonatomic, strong) headView *headView;


@property (nonatomic, strong)NSMutableArray *futureModelArray;

@property (nonatomic, copy) NSString *cityname;

//@property (nonatomic, strong)UIButton *cityBtn;
@property (nonatomic, strong)UIImageView    *imageView;

@end
