//
//  ViewController.m
//  FengurUWDatePickerDemo
//
//  Created by 王智超 on 15/11/4.
//  Copyright © 2015年 UWFengur. All rights reserved.
//

#import "SetRemindTimeViewController.h"
#import "UWDatePickerView.h"
@interface SetRemindTimeViewController ()<UWDatePickerViewDelegate>
{
    UWDatePickerView *_pickerView;
}
@end

@implementation SetRemindTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self timePick];

}


- (void)timePick
{
    [self setupDateView:DateTypeOfStart];
}

- (void)setupDateView:(DateType)type {
    
    _pickerView = [UWDatePickerView instanceDatePickerView];
    _pickerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [_pickerView setBackgroundColor:[UIColor greenColor]];
    _pickerView.delegate = self;
    _pickerView.type = type;
    [self.view addSubview:_pickerView];
    
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    
    NSLog(@"时间 : %@",date);
    switch (type) {
        case DateTypeOfStart:
            // TODO 日期确定选择
            [[NSUserDefaults standardUserDefaults]setObject:date forKey:@"remindTime"];
            
            
            break;
            
        case DateTypeOfEnd:
            // TODO 日期取消选择
            
            
            break;
        default:
            break;
    }
}

- (void)cancleClink{

    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com