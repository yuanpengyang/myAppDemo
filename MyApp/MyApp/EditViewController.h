//
//  EditViewController.h
//  MyApp
//
//  Created by Alan on 15/12/3.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController<UIAlertViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, assign) NSInteger  row;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray *timeArray;

@end
