//
//  AddNoteController.m
//  MyApp
//
//  Created by Alan on 15/12/5.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "AddNoteController.h"

@interface AddNoteController ()

@end

@implementation AddNoteController

- (void)viewDidLoad {
    [super viewDidLoad];
    //编辑视图
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0,
                                                                60,
                                                                self.view.bounds.size.width,
                                                                self.view.bounds.size.height)];
    
    [self.view addSubview:self.textView];
    [self.textView becomeFirstResponder];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(AddAct)];
    self.navigationItem.rightBarButtonItem = btn;

}


- (void)AddAct{

    NSMutableArray *initNoteArray = [[NSMutableArray alloc]init];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"note"]==nil) {
        [[NSUserDefaults standardUserDefaults] setObject:initNoteArray forKey:@"note"];
    }
    NSArray *tempNoteArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"note"];
    NSMutableArray *mutableNoteArray = [tempNoteArray mutableCopy];
    NSString *textstring = [self.textView text];
    [mutableNoteArray insertObject:textstring atIndex:0 ];

    [[NSUserDefaults standardUserDefaults] setObject:mutableNoteArray forKey:@"note"];
    
    NSMutableArray *initDateArray = [[NSMutableArray alloc]init];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"date"]==nil) {
        [[NSUserDefaults standardUserDefaults] setObject:initDateArray forKey:@"date"];
    }
    NSArray *tempDateArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    NSMutableArray *mutableDateArray = [tempDateArray mutableCopy];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init ];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    NSDate *now = [NSDate date];
    NSString *datestring = [dateFormatter stringFromDate:now];
    [mutableDateArray insertObject:datestring atIndex:0 ];
    // FirstViewController *rootctrl = [[FirstViewController alloc]init];
    // rootctrl.noteArray = mutableNoteArray;
    // rootctrl.dateArray = mutableDateArray;
    [[NSUserDefaults standardUserDefaults] setObject:mutableDateArray forKey:@"date"];
    
    
    [self.textView resignFirstResponder];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"save success!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        
        
        
    });
    
    

}






@end
