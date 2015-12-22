//
//  PriorityHeadView.m
//  MyApp
//
//  Created by Alan on 15/12/18.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "PriorityHeadView.h"

@implementation PriorityHeadView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}


- (void)createView{

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    label.text = @"优先级";
    [self addSubview:label];
  
    bg = [[UIView alloc]initWithFrame:CGRectMake(150, 0, 50, 50)];
    bg.backgroundColor = [UIColor grayColor];
    [self addSubview:bg];
   
    
    for (int i = 0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(200+i*50, 0, 50, 50);
        [self addSubview:button];
        button.tag = 102+i;
        NSString *string = [NSString stringWithFormat:@"%d",i+1];
        [button setTitle:string forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

        [button addTarget:self action:@selector(buttonClink:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 0, 50, 50);
    [self addSubview:button];
    button.tag = 101;
    NSString *string = @"无";
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClink:) forControlEvents:UIControlEventTouchUpInside];
   
}

- (void)buttonClink:(UIButton *)button{

    NSInteger i = button.tag-100;
    bg.frame = CGRectMake(150+i*50-50, 0, 50, 50);

}


- (void)layoutSubviews{

    [super layoutSubviews];
    
    


}

@end
