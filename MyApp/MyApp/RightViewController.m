//
//  RightViewController.m
//  MyApp
//
//  Created by Alan on 15/12/2.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImageView *headImage = [[UIImageView alloc]initWithFrame:CGRectMake(70, 50, 50, 50)];
    [self.view addSubview:headImage];
    headImage.backgroundColor = [UIColor redColor];
    
    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.frame = CGRectMake(70, 220+i*40, 50, 30);
        button.backgroundColor = [UIColor grayColor];
        [self.view addSubview:button];
    }
    
}


@end
