//
//  AddDetailViewController.h
//  MyApp
//
//  Created by Alan on 15/12/17.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *text;


//@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (nonatomic, strong) NSString *groupName;

@end
