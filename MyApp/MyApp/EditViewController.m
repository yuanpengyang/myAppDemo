//
//  EditViewController.m
//  MyApp
//
//  Created by Alan on 15/12/3.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "EditViewController.h"
#import "UIView+UIViewController.h"
#import "FirstViewController.h"

#define NchangeCell @"changecell"

@interface EditViewController ()

@end

@implementation EditViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"EditView");
    [self createView];
    [self loadDate];
    
    
}


- (void)loadDate{

    NSArray *noteArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"note"];
    NSString *oldText  = [noteArray objectAtIndex:self.row];
    self.textView.text = oldText;

}


- (void)createView{
   
    //编辑视图
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0,
                                                                60,
                                                                self.view.bounds.size.width,
                                                                self.view.bounds.size.height)];

    [self.textView becomeFirstResponder];
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc]initWithTitle:@"Save"
                                                               style:UIBarButtonItemStylePlain target:self
                                                              action:@selector(SaveAct)];
    
    UIBarButtonItem *deleteBtn = [[UIBarButtonItem alloc]initWithTitle:@"Delete"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(DeleteAct)];
    
    NSArray *btnArray = [[NSArray alloc]initWithObjects:saveBtn,deleteBtn, nil];
    self.navigationItem.rightBarButtonItems = btnArray;
    [self.view addSubview:self.textView];


}

- (void)SaveAct{

    //键盘消失
    [self.textView endEditing:YES];
    [self.textView resignFirstResponder];
    
    
    NSArray *tempArry = [[NSUserDefaults standardUserDefaults]objectForKey:@"note"];
    NSMutableArray *mutabArry = [tempArry mutableCopy];
    NSString *textStr = self.textView.text;
    [mutabArry removeObjectAtIndex:self.row];
    //[mutabArry setObject:textStr atIndexedSubscript:0];
    [mutabArry insertObject:textStr atIndex:0];
    [[NSUserDefaults standardUserDefaults]setObject:mutabArry forKey:@"note"];
  //  NSLog(@"array %@",mutabArry);
    
    //获得系统时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init ];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    NSDate *now = [NSDate date];
    NSString *datestring = [dateFormatter stringFromDate:now];
    //NSLog(@"%@",datestring);

    NSArray *tempdateArry = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
    NSMutableArray *mutabdateArry = [tempdateArry mutableCopy];
    
    [mutabdateArry removeObjectAtIndex:self.row];
    //[mutabdateArry setObject:datestring atIndexedSubscript:0];
    [mutabdateArry insertObject:datestring atIndex:0];
    [[NSUserDefaults standardUserDefaults]setObject:mutabdateArry forKey:@"date"];
    
//    FirstViewController *firstVC = [[FirstViewController alloc]init];
//    firstVC.noteArray = mutabArry;
//    firstVC.dateArray = mutabdateArry;

    
//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 0.25*NSEC_PER_SEC);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"save success!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        
        
        
    });
    
  
    

    
}

- (void)DeleteAct{
    //键盘消失
    [self.textView resignFirstResponder];
    
    NSArray *tempArry = [[NSUserDefaults standardUserDefaults]objectForKey:@"note"];
    NSMutableArray *mutabArry = [tempArry mutableCopy];
    //[mutabArry removeObject:mutabArry[self.row]];
    [mutabArry removeObjectAtIndex:self.row];
    NSArray *tempdateArry = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
    NSMutableArray *mutabdateArry = [tempdateArry mutableCopy];
    //[mutabdateArry removeObject:mutabdateArry[self.row]];
    [mutabdateArry removeObjectAtIndex:self.row];

    [[NSUserDefaults standardUserDefaults]setObject:mutabArry forKey:@"note"];
    [[NSUserDefaults standardUserDefaults]setObject:mutabdateArry forKey:@"date"];
    
    
//    FirstViewController *firstVC = [[FirstViewController alloc]init];
//    firstVC.noteArray = mutabArry;
//    firstVC.dateArray = mutabdateArry;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"delete success!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
        
        
        
    });
    

}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    
    return;

}



//
//- (void)leftAction{
//
//    //键盘消失
//    [self.textView resignFirstResponder];
//   
//    //获得系统时间
// 
//    NSString *time = [self getTime];
//    self.timeArray[self.index.row] = time;
//    
//    self.array[self.index.row] = self.textView.text;
//    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:
//    self.array    ,@"array",
//    self.index    ,@"index",
//    self.timeArray,@"time" ,nil];
//    
//    
//    NSLog(@"edit-----%@",self.array);
//    NSLog(@"edit-----%li",self.index.row);
//    
//    //发出通知
////    NSNotification *notification = [NSNotification notificationWithName:NchangeCell
////                                                                 object:nil
////                                                               userInfo:dic];
//    [[NSNotificationCenter defaultCenter] postNotificationName:NchangeCell object:nil userInfo:dic];
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}
//
//
//- (NSString*)getTime{
//
//    //获得系统时间
//    NSDate *date = [NSDate date];
//    NSString *time;
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"YYYY/MM/dd/hh:mm"];
//    time = [formatter stringFromDate:date];
//    
//    //NSLog(@"%@",time);
//    return  time;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}



@end
