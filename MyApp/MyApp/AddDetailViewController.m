//
//  AddDetailViewController.m
//  MyApp
//
//  Created by Alan on 15/12/17.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "AddDetailViewController.h"
#define kscreenwidth self.view.bounds.size.width
#define kscreenheight self.view.bounds.size.height
@interface AddDetailViewController ()

@end

@implementation AddDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
//                                                                          0,
//                                                                          kscreenwidth,
//                                                                          kscreenheight)];
//    imageView.image = [UIImage imageNamed:@"mask_bg.jpg"];
//    imageView.userInteractionEnabled = YES;
//    [self.view addSubview:imageView];
   
    self.text.backgroundColor = [UIColor redColor];
    [self.text becomeFirstResponder];
//    [self.deleteButton addTarget:self action:@selector(deleteClink) forControlEvents:UIControlEventTouchUpInside];
    [self.saveButton addTarget:self action:@selector(saveClink) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)saveClink{
     NSString *string = self.text.text;
    if(![string isEqualToString:@""]){
        NSArray *initArray = [[NSArray alloc]init];
        if ([[NSUserDefaults standardUserDefaults]objectForKey:self.groupName] == nil) {
            [[NSUserDefaults standardUserDefaults]setObject:initArray forKey:self.groupName];
        }
        NSArray *temp = [[NSUserDefaults standardUserDefaults]objectForKey:self.groupName];
        NSMutableArray *mutalArray = [temp mutableCopy];
        
        [mutalArray addObject:string];
        [[NSUserDefaults standardUserDefaults]setObject:mutalArray forKey:self.groupName];
    
    
    }
 
    [self resignFirstResponder];
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
