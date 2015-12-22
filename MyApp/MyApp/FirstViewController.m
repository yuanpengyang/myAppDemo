//
//  FirstViewController.m
//  MyApp
//
//  Created by Alan on 15/12/2.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "FirstViewController.h"
#import "MemorandumCell.h"
#import "EditViewController.h"
#import "TabbarView.h"
#import "AddNoteController.h"
#define NchangeCell @"changecell"
static NSString *memorandumCellId = @"memorandumCellId";


@interface FirstViewController ()

@end

@implementation FirstViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        
   

    }
    return self;
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
    
}





- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.noteArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"note"];
    self.dateArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"date"];
    [self.tabView reloadData];
    
}


- (void)viewDidLoad{

    [self createRightBtn];
    
    self.imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.imageView.image = [UIImage imageNamed:@"mask_bg.jpg"];
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    
    self.tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.tabView.backgroundColor = [UIColor clearColor];
    [self.imageView addSubview:self.tabView];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
//    self.tabView.delaysContentTouches = NO;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftBtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:@"add" forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = barBtn;
    
    UIImage *image = [UIImage imageNamed:@"mask_titlebar64@2x.png"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"MemorandumCell" bundle:nil];
    [self.tabView registerNib:nib forCellReuseIdentifier:memorandumCellId];

    

}

- (void)addAction{

    AddNoteController *addVC = [[AddNoteController alloc]init];
    
    [self.navigationController pushViewController:addVC animated:YES];

}


#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return  40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.dateArray.count;
    
}
    

    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MemorandumCell *cell = [tableView dequeueReusableCellWithIdentifier:memorandumCellId forIndexPath:indexPath];
       // [contents addObject:cell.contentLabel.text];
    
    if (cell==nil) {
        cell = [[MemorandumCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:memorandumCellId];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    cell.contentLabel.text = self.noteArray[indexPath.row];
    cell.timeLabel.text = self.dateArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    //NSLog(@"cell.content.text %@",cell.contentLabel.text);
    
    
//    
//    for (id obj in cell.subviews)
//    {
//        if ([NSStringFromClass([obj class])isEqualToString:@"UITableViewCellScrollView"])
//        {
//            UIScrollView *scroll = (UIScrollView *) obj;
//            scroll.delaysContentTouches =NO;
//            break;
//        }
//    }
    
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EditViewController *editVC = [[EditViewController alloc]init];
    
    
    //    editVC.array     = [NSMutableArray arrayWithArray:contents];
    //    editVC.timeArray = [NSMutableArray arrayWithArray:times];
    editVC.row = [indexPath row];
    
    [self.navigationController pushViewController:editVC animated:YES];
    
}


//- (void)changeCell:(NSNotification *)notic{
//
//    
//    contents  = notic.userInfo[@"array"];
//   // NSIndexPath *index = notic.userInfo[@"index"];
//    times = notic.userInfo[@"time"];
//  
//    [self.tabView reloadData];
//    
//    //存入本地数据库
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:contents,@"array",
//                                                                   times,@"time",nil];
//   
//    
//    
//    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
//    [userdefaults setObject:dic forKey:@"mydic"];
//    
//    
// 
//   
//    
//}
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    //注册通知
//    
//    [[NSNotificationCenter defaultCenter]addObserver:self
//                                            selector:@selector(changeCell:)
//                                                name:NchangeCell
//                                              object:nil];
//    
//    //从本地数据提取
//    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
//    self.dic = [[NSDictionary alloc]init];
//    self.dic = [userdefaults dictionaryForKey:@"mydic"];
//    contents = [[NSMutableArray alloc]init];
//    contents = [self.dic objectForKey:@"array"];
//    times    = [[NSMutableArray alloc]init];
//    times    = [self.dic objectForKey:@"time"];
//    
//    
//    
//    
//    [self loadData];
//    
//    
//    self.tabView = [[UITableView alloc]initWithFrame:CGRectMake(0,
//                                                                        50,
//                                                                        self.view.bounds.size.width,
//                                                                        self.view.bounds.size.height)];
//    self.tabView.dataSource = self;
//    self.tabView.delegate   = self;
//    
//    [self.view addSubview:self.tabView];
//    
//  
//    
//    //注册单元格
//    UINib *nib = [UINib nibWithNibName:@"MemorandumCell" bundle:nil];
//    [self.tabView registerNib:nib forCellReuseIdentifier:memorandumCellId];
//    
//    
//}
//-(void)dealloc
//{
//    //移除通知
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:NchangeCell object:nil];
//
//    
//}
//
//
//
//- (void)loadData{
//    
//
//    NSLog(@"fir-----%@",contents);
//   
////    [contents addObject:@"1211"];
////    [contents addObject:@"1212"];
////    [contents addObject:@"1213"];
////    [contents addObject:@"1214"];
////    [contents addObject:@"1215"];
////    [contents addObject:@"1216"];
//   // NSLog(@"count %li",contents.count);
//
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return 50;
//
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    return contents.count;
//
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    return 1;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    MemorandumCell *cell = [tableView dequeueReusableCellWithIdentifier:memorandumCellId forIndexPath:indexPath];
//   // [contents addObject:cell.contentLabel.text];
//    
//    cell.contentLabel.text = contents[indexPath.row];
//    
//  
//    cell.timeLabel.text = @"2015";//times[indexPath.row];
//    
//    return cell;
//
//}
//
//


@end
