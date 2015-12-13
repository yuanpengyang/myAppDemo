//
//  tabbarViewController.m
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "tabbarViewController.h"
#import "tabbarView.h"
#import "UIViewController+MMDrawerController.h"
#import "BaseNavController.h"

#define SELECTED_VIEW_CONTROLLER_TAG 98456345

@interface tabbarViewController ()

@end

@implementation tabbarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //2.创建子控制器
    [self _createViewControllers];
    
    [self createTabbarView];
    
    
}



//2.创建子控制器
- (void)_createViewControllers {
    
    //1、定义各个模块的故事版的文件名
   
    NSArray *storyboardNames = @[@"First",@"Second",@"Third",@"Fourth"];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:4];
    for (int i=0; i<storyboardNames.count; i++) {
        
        //2.取得故事板的文件名
        NSString *name = storyboardNames[i];
        
        //3.创建故事板加载对象
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        
        //4.加载故事板，获取故事板中箭头指向的控制器对象
        UINavigationController *navigation = [storyboard instantiateInitialViewController];
        
        [viewControllers addObject:navigation];
    }
    
    self.viewControllers = viewControllers;
    
    
}


- (void)createTabbarView{
    
    //把原tabBar上的按钮移除
    for (UIView *view in self.tabBar.subviews ) {
        
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }
//    
//    _tabbarView = [[tabbarView alloc]initWithFrame:CGRectMake(0,  self.view.frame.size.height - 60, self.view.bounds.size.width, 60)];
//    _tabbarView = [[tabbarView alloc]initWithFrame:CGRectMake(0,  0, self.view.bounds.size.width, 40)];
//    [self.tabBar addSubview:_tabbarView];
    
    
    
    _tabbarView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbar_0"]];
    [_tabbarView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
    [_tabbarView setUserInteractionEnabled:YES];
    
    
    [self.tabBar addSubview:_tabbarView];
    
    
    _tabbarViewCenter = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbar_mainbtn_bg"]];

    _tabbarViewCenter.center = CGPointMake(_tabbarView.center.x, _tabbarView.bounds.size.height/2.0-10);

    [_tabbarViewCenter setUserInteractionEnabled:YES];

    _button_center = [UIButton buttonWithType:UIButtonTypeCustom];
    _button_center.adjustsImageWhenHighlighted = YES;
    [_button_center setBackgroundImage:[UIImage imageNamed:@"tabbar_mainbtn"] forState:UIControlStateNormal];
    
    [_button_center setFrame:CGRectMake(0, 0, 46, 46)];

    _button_center.center =CGPointMake(_tabbarViewCenter.bounds.size.width/2.0, _tabbarViewCenter.bounds.size.height/2.0 + 5) ;

    [_tabbarViewCenter addSubview:_button_center];
    
    [self.tabBar addSubview:_tabbarViewCenter];
    
    self.tabBar.frame =CGRectMake(0,self.view.bounds.size.height-58, self.view.bounds.size.width, 60);
    
    
    [self layoutBtn];

 
  
    
}


-(void)layoutBtn
{
    
    
    // NSLog(@"%f",self.bounds.size.width);
    _button_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [_button_1 setBackgroundColor:[UIColor blueColor]];
    [_button_1 setFrame:CGRectMake(0, 0, 74, 60)];
    [_button_1 setTag:0];
    [_button_1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    _button_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_2 setFrame:CGRectMake(75, 0, 74, 60)];
    [_button_2 setTag:1];
    [_button_2 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    _button_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_3 setFrame:CGRectMake(222, 0, 74, 60)];
    [_button_3 setTag:2];
    [_button_3 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    _button_4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button_4 setFrame:CGRectMake(297, 0, 74, 60)];
    [_button_4 setTag:3];
    [_button_4 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:_button_1];
    [self.tabBar addSubview:_button_2];
    [self.tabBar addSubview:_button_3];
    [self.tabBar addSubview:_button_4];
    
}

-(void)btn1Click:(id)sender
{
    
    UIButton *btn = (UIButton *)sender;
    // NSLog(@"%i",btn.tag);
    
    self.selectedIndex = btn.tag;
    
    
    switch (btn.tag) {
        case 0:
        {
            [_tabbarView setImage:[UIImage imageNamed:@"tabbar_0"]];
           // [self touchBtnAtIndex:0];
            
            break;
        }
        case 1:
        {
            [_tabbarView setImage:[UIImage imageNamed:@"tabbar_1"]];
         //   [self touchBtnAtIndex:1];
            break;
        }
        case 2:
            [_tabbarView setImage:[UIImage imageNamed:@"tabbar_3"]];
        //    [self touchBtnAtIndex:2];
            break;
        case 3:
            [_tabbarView setImage:[UIImage imageNamed:@"tabbar_4"]];
         //   [self touchBtnAtIndex:3];
            break;
        default:
            break;
    }
}




-(void)touchBtnAtIndex:(NSInteger)index
{
        UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
        [currentView removeFromSuperview];
    
    
        NSDictionary* data = [_arrayViewcontrollers objectAtIndex:index];
    
        UINavigationController *viewController = data[@"viewController"];
        viewController.view.tag   = SELECTED_VIEW_CONTROLLER_TAG;
        viewController.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height- 50);
    
        [self.view insertSubview:viewController.view belowSubview:_tabbarView];
    
    
    
    //UINavigationController *navi =  self.viewControllers[index];
    
//    NSMutableArray *mutaArry = [NSMutableArray arrayWithArray:self.viewControllers];
//    
//    [mutaArry exchangeObjectAtIndex:index withObjectAtIndex:0];
//    
//    self.viewControllers = mutaArry;
//    
    
    
}




//-------------------------------------------------------------------------

//- (void)createRightBtn{
//    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
//    [rightBtn setTitle:@"个人设置" forState:UIControlStateNormal];
//    rightBtn.frame = CGRectMake(200, 10, 20, 20);
//    [rightBtn sizeToFit];
//    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = barBtn;
//    // rightBtn.tag = 101;
//    
//    
//}
//
//
//- (void)rightAction:(UIButton*) btn{
//    
//    NSLog(@"right clink");
//    
//    MMDrawerController *mmDraw = self.mm_drawerController;
//    [mmDraw openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
//    
//    //    if (btn.tag == 101) {
//    //
//    //        [mmDraw openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
//    //        btn.tag = 102;
//    //    }
//    //    else if (btn.tag == 102) {
//    //        [mmDraw closeDrawerAnimated:YES completion:nil];
//    //        btn.tag = 101;
//    //    }
//}
//
//
//
//
//
//
//
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//
//-(NSArray *)getViewcontrollers
//{
//    NSArray* tabBarItems = nil;
//    
//    
//    FirstViewController *first    = [[FirstViewController alloc]init];
//    
//    SecondViewController *second  = [[SecondViewController alloc]init];
//    
//    ThirdViewController *third    = [[ThirdViewController alloc]init];
//    
//    FourthViewController *fourth  = [[FourthViewController alloc]init];
//    
//  //  NSMutableArray *controllers = [[NSMutableArray alloc]initWithCapacity:4];
////    BaseNavController *navFirst = [[BaseNavController alloc]initWithRootViewController:first];
////    BaseNavController *navSecond = [[BaseNavController alloc]initWithRootViewController:second];
////    BaseNavController *navThird = [[BaseNavController alloc]initWithRootViewController:third];
////    BaseNavController *navFourth = [[BaseNavController alloc]initWithRootViewController:fourth];
////    [controllers addObject:first];
////    [controllers addObject:second];
////    [controllers addObject:third];
////    [controllers addObject:fourth];
////    self.viewControllers = controllers;
////    navFirst.navigationBar.backgroundColor = [UIColor redColor];
////    navSecond.navigationBar.backgroundColor = [UIColor greenColor];
////
//    
//    [self addChildViewController:first];
//    [self addChildViewController:second];
//    [self addChildViewController:third];
//    [self addChildViewController:fourth];
//    
//    tabBarItems = [NSArray arrayWithObjects:
//                   [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", first, @"viewController",@"主页",@"title", nil],
//                   [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", second, @"viewController",@"主页",@"title", nil],
//                   [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", third, @"viewController",@"主页",@"title", nil],
//                   [NSDictionary dictionaryWithObjectsAndKeys:@"tabicon_home", @"image",@"tabicon_home", @"image_locked", fourth, @"viewController",@"主页",@"title", nil],nil];
//    return tabBarItems;
//    
//}

@end
