//
//  SetDetailViewController.m
//  MyApp
//
//  Created by Alan on 15/12/17.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "SetDetailViewController.h"
#define kscreenwidth self.view.bounds.size.width
#define kscreenheight self.view.bounds.size.height

static NSString *remindTimeCell = @"remindTimeCell";
static NSString *repeatCell     = @"repeatCell";
@interface SetDetailViewController ()

@end

@implementation SetDetailViewController

- (void)viewWillAppear:(BOOL)animated{

    remindtime = [[NSUserDefaults standardUserDefaults]objectForKey:@"remindTime"];
    repeat     = [[NSUserDefaults standardUserDefaults]objectForKey:@"repeat"];
    [self.tableView reloadData];
    
    
}


- (void)sendRemind{
    
 
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 设置触发通知的时间
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    NSLog(@"fireDate=%@",fireDate);
    
    notification.fireDate = fireDate;
    // 时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitEra;
    
    // 通知内容
    //notification.alertBody =  @"什么啊啊啊啊";
    notification.applicationIconBadgeNumber = 1;
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 通知参数
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:self.detailName forKey:@"key"];
    notification.userInfo = userDict;
    
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSCalendarUnitDay;
    } else {
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSDayCalendarUnit;
    }
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    

}


- (void)cancelLocalNotificationWithKey:(NSString *)key {
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            // 根据设置通知参数时指定的key来获取通知参数
            NSString *info = userInfo[key];
            
            // 如果找到需要取消的通知，则取消
            if (info != nil) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;  
            }  
        }  
    }  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubView];
    
 
    
}

- (void)createSubView{
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UIImage *image = [UIImage imageNamed:@"mask_titlebar64@2x.png"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                          64,
                                                                          kscreenwidth,
                                                                          kscreenheight)];
    imageView.image = [UIImage imageNamed:@"mask_bg.jpg"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(200, 10, 50, 50);
    [rightButton addTarget:self action:@selector(finishClink) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    self.navigationItem.rightBarButtonItem = button;
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                                  64,
                                                                  kscreenwidth,
                                                                  kscreenheight)];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    
    dateswitch = [[UISwitch alloc]initWithFrame:CGRectMake(kscreenwidth-50, 10, 50, 50)];
    [dateswitch addTarget:self
                   action:@selector(switchValuChange)
         forControlEvents:UIControlEventValueChanged];
    
    dateswitch.on = NO;
    
    locationswitch = [[UISwitch alloc]initWithFrame:CGRectMake(kscreenwidth-50, 10, 50, 50)];
    [locationswitch addTarget:self
                   action:@selector(locationswitchValuChange)
         forControlEvents:UIControlEventValueChanged];
    
    locationswitch.on = NO;
    
    
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"RemindTimeTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:remindTimeCell];
    
    
    UINib *nibRepeat = [UINib nibWithNibName:@"RepeatTableViewCell" bundle:nil];
    [self.tableView registerNib:nibRepeat forCellReuseIdentifier:repeatCell];

}

- (void)finishClink{

    [self dismissViewControllerAnimated:YES completion:nil];

}


- (void)singleGestureCaptured:(UITapGestureRecognizer *)gesture {
    
    if (_up) {
        
        _up = !_up;
        
        [self setMySize];
        
    }
    
    [foottextView resignFirstResponder];
    
}

- (void)setMySize{

    foottextView.returnKeyType = UIReturnKeyDone;
    
    if (_up) {
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:0.1];
        
        float YOffset = -250.0;
        
        CGRect frame = self.tableView.frame;
        
        frame.origin.y += YOffset;
        
        self.tableView.frame = frame;
        
        [UIView commitAnimations];

        
        
        
        
    }
    
    else {
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelay:0.1];
        
        float YOffset = 250.0;
        
        CGRect frame = self.tableView.frame;
        
        frame.origin.y += YOffset;
        
        self.tableView.frame = frame;
        
        [UIView commitAnimations];

        
    }
    

}


- (void)switchValuChange{

    if (dateswitch.on == NO) {
      
        [self cancelLocalNotificationWithKey:@"key"];
        [self.tableView reloadData];

    }else{
        [self sendRemind];
        [self.tableView reloadData];
    
    }
    
    
}

- (void)locationswitchValuChange{

    if (locationswitch.on == NO) {
        [self.tableView reloadData];
    }else{
        [self.tableView reloadData];
    }

}

#pragma mark tableDataSource


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
   
    return  50;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 3) {
        return 100;
    }
    
    return 40;
    

}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
     UIView *view = [[UIView alloc]init];
    if (section == 0) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        return  view;
        
    }if (section == 3) {
       
        PriorityHeadView *priority = [[PriorityHeadView alloc]init];
        priority.backgroundColor = [UIColor whiteColor];
        return priority;
    }if (section == 1) {
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kscreenwidth-50, 50)];
        label.text = @"在指定日期提醒我";
        [view addSubview:label];
      
        [view addSubview:dateswitch];
        
        return view;
    }if (section == 2) {
       
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kscreenwidth-50, 50)];
        label.text = @"在指定位置提醒我";
        [view addSubview:label];
        
        [view addSubview:locationswitch];
        
        return view;
    }
    
    
    else{
       
        view.backgroundColor = [UIColor whiteColor];
        
    }
    
    return  view;

}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    UIView *view = [[UIView alloc]init];
    if (section == 3) {
        
        UIView *view = [[UIView alloc]init];
        view.userInteractionEnabled = YES;
        UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kscreenwidth, 15)];
        label.text = @"备注";
        label.backgroundColor = [UIColor whiteColor];
        [view addSubview:label];
        
        foottextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 15, kscreenwidth, 60)];
        [view addSubview:foottextView];
       
        UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleGestureCaptured:)];
        single.delegate = self;
        
        [foottextView addGestureRecognizer:single];
        foottextView.delegate = self;
       
    return view;
        
    }else{
        
        view.backgroundColor = [UIColor clearColor];
    }
    
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        
        if (dateswitch.on == NO) {
            return 0;
        }else{
            return 2;
        
        }
        
        
    }if (section == 2) {
        if (locationswitch.on == NO) {
            return 0;
        }else{
            return 1;
        
        }
    }
    
    
    else {
        return 1;
    }

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  4;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   

    if (indexPath.section == 0) {
         UITableViewCell *cell = [[UITableViewCell alloc]init];
        cell.textLabel.text = self.detailName;
    
        return cell;
    }
    if (indexPath.section == 3) {
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        UILabel *listLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        listLabel.text = @"列表";
        
        [cell addSubview:listLabel];
        
        CGSize maxSize = CGSizeMake(MAXFLOAT, 40);
        CGSize labelSize = [self labelAutoCalculateRectWith:self.groupName FontSize:15.0f MaxSize:maxSize];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kscreenwidth-labelSize.width-50, 0, labelSize.width+50, 50)];
        label.text = self.groupName;
        [cell addSubview:label];
        
        return cell;
    }
    if (indexPath.section == 1) {
        
        if (dateswitch.on == YES ) {
            if (indexPath.row == 0) {
                
                RemindTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:remindTimeCell forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[RemindTimeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:remindTimeCell];
                }
                
               
                if (remindtime == nil) {
                    remindtime = [self getSystemTime];
                }
               
                cell.remindTime.text = remindtime;
                cell.remindTime.textAlignment = NSTextAlignmentRight;
                cell.label.text = @"提醒时间";
                return  cell;
            }if (indexPath.row == 1) {
                
                
                RepeatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:repeatCell forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[RepeatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:repeatCell];
                }
                cell.label.text = @"重复";
                if (repeat == nil) {
                    repeat = @"永不";
                }
                cell.repeatLabel.text = repeat;
                cell.repeatLabel.textAlignment = NSTextAlignmentRight;
                
                
            }else{
            
                UITableViewCell *cell = [[UITableViewCell alloc]init];
                NSString *time = [self getSystemTime];
                cell.textLabel.text = time;
                return  cell;
            }

        }
    }if (indexPath.section == 2) {
        
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        
        return cell;
        
        
    }
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    

    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1 && indexPath.row == 0) {
        
      
        
        SetRemindTimeViewController *setRemindTime = [[SetRemindTimeViewController alloc]init];
        
        [self.navigationController pushViewController:setRemindTime animated:YES];
        
        
        
    }


}


//得到text size
- (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize
{
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    //如果系统为iOS7.0；
    CGSize labelSize;
    if (![text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
        labelSize = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
    }
    //如果是IOS6.0
    　else
        　　{
            labelSize = [text boundingRectWithSize: maxSize
                                           options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine
                                        attributes:attributes
                                           context:nil].size;
        }
    labelSize.height=ceil(labelSize.height);
    labelSize.width=ceil(labelSize.width);
    return labelSize;
}



#pragma mark textViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    
        
        if (!_up) {
            
            _up = !_up;
            
            [self setMySize];
            
        }
        
    
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        if (_up) {
            
            _up = !_up;
            
            [self setMySize];
            
        }
        
        return NO;
        
    }
    
    
    
    return YES;
    
    
    
}


- (NSString*)getSystemTime{

    //获得系统时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init ];
    [dateFormatter setDateFormat:@"YY/MM/dd HH:mm"];
    NSDate *now = [NSDate date];
    NSString *datestring = [dateFormatter stringFromDate:now];
    
   
    return datestring;

}

@end
