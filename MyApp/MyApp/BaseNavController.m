//
//  BaseNavController.m
//  MyApp
//
//  Created by Alan on 15/12/3.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "BaseNavController.h"
#import "UIViewController+MMDrawerController.h"
@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRightBtn];
}


- (void)createRightBtn{
    
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
    
    //    if (btn.tag == 101) {
    //
    //        [mmDraw openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    //        btn.tag = 102;
    //    }
    //    else if (btn.tag == 102) {
    //        [mmDraw closeDrawerAnimated:YES completion:nil];
    //        btn.tag = 101;
    //    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
