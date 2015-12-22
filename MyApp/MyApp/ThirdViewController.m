//
//  ThirdViewController.m
//  MyApp
//
//  Created by Alan on 15/12/2.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "ThirdViewController.h"

#define kscreenwidth self.view.bounds.size.width
#define kscreenheight self.view.bounds.size.height

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                          64,
                                                                          kscreenwidth,
                                                                          kscreenheight)];
    imageView.image = [UIImage imageNamed:@"mask_bg.jpg"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
   
    
    //导航控件
    [self createRightBtn];
    
    
    //group
    self.grouptableView = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                                      64,
                                                           kscreenwidth,
                                                           kscreenheight)];
     self.grouptableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.grouptableView];
   
        
    self.grouptableView.delegate = self;
    self.grouptableView.dataSource = self;
    groupArray = [[NSMutableArray alloc] init];
    

    
}


- (void)viewWillAppear:(BOOL)animated{
    
    groupArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"group"];
    [self.grouptableView reloadData];
    
}

#pragma mark uitabledatasource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return groupArray.count+1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell selected at index path %ld", (long)indexPath.row);
    if (indexPath.row == 0) {
       
        AddGroupViewController *addGrouptableVC = [[AddGroupViewController alloc]init];
        [self presentViewController:addGrouptableVC animated:YES completion:^{
        
            
        }];
    }else{
    
        //detail
        DetialViewController  *detailtableVC = [[DetialViewController alloc]init];

        detailtableVC.index = indexPath.row-1;
        
        [self presentViewController:detailtableVC animated:YES completion:^{
            
            
            
            
        }];
        

    
    
    }
    
    
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifierGroup = @"CellGroup";
    GroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierGroup];
    if (cell == nil) {
        cell = [[GroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:cellIdentifierGroup];
        
        
    }
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"新建列表";
    }else{
        
       
        cell.textLabel.text = [groupArray objectAtIndex:indexPath.row-1];
        
        
    }
    
    
    return  cell;
    
}



#pragma mark - navi
- (void)createRightBtn{
    
    UIImage *image = [UIImage imageNamed:@"mask_titlebar64@2x.png"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"个人设置" forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(200, 10, 20, 20);
    [rightBtn sizeToFit];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = barBtn;
    // rightBtn.tag = 101;
    
    
}


- (void)rightAction:(UIButton*) btn{
    
    NSLog(@"right clink");
    
    MMDrawerController *mmDraw = self.mm_drawerController;
    [mmDraw openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    
}


@end
