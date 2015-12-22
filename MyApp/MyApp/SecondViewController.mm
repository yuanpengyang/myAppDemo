//
//  SecondViewController.m
//  MyApp
//
//  Created by Alan on 15/12/2.
//  Copyright © 2015年 Abel. All rights reserved.
//


//    /* 全国天气预报 */
//    [self test:kJHAPIS_LIFE_WEATHER_INDEX         parameters:@{@"cityname":@"苏州"}];
//    [self test:kJHAPIS_LIFE_WEATHER_UNI         parameters:@{}];
//    [self test:kJHAPIS_LIFE_WEATHER_IP         parameters:@{@"ip":@"58.215.185.154"}];
//    [self test:kJHAPIS_LIFE_WEATHER_GEO         parameters:@{@"lon":@"116.39277" , @"lat":@"39.933748"}];
//    [self test:kJHAPIS_LIFE_WEATHER_FORECAST3H         parameters:@{@"cityname":@"苏州"}];
//    [self test:kJHAPIS_LIFE_WEATHER_CITYS         parameters:@{}];
//





#import "SecondViewController.h"
#import <JuheApis/JuheAPI.h>
#import <JuheApis/JHOpenidSupplier.h>
#import <JuheApis/JHSDKAPIPath.h>
#import "weatherModel.h"

static NSString *weatherCellId = @"weatherCellId";

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getCityName:) name:@"city" object:nil];
    
    UIImage *image = [UIImage imageNamed:@"mask_titlebar64@2x.png"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.parentViewController.navigationItem.leftBarButtonItem = leftBtn;
    
    [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JHd49ecb9bad8e346f0947cf57eeb4359b"];
    //创建tableView;
    [self createTableView];

    [self loadData];
    
   
    [self createRightBtn];
  
    
}


- (void)createRightBtn{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"个人设置" forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(200, 10, 20, 20);
    [rightBtn sizeToFit];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = barBtn;
  
    
    
}





- (void)rightAction:(UIButton*) btn{
    
    NSLog(@"right clink");
    
    MMDrawerController *mmDraw = self.mm_drawerController;
    [mmDraw openDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    
}


- (void)getCityName:(NSNotification*)nofica{
    self.cityname = [nofica.userInfo objectForKey:@"city"];
    
    [cityBtn setTitle:self.cityname forState:UIControlStateNormal];
  
    [self loadData];

}

- (void)leftBtn{

    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftBtn addTarget:self action:@selector(changeCity) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:@"city" forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = barBtn;

}


- (void)createTableView{

    
    [self leftBtn];
    self.imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.imageView.image = [UIImage imageNamed:@"mask_bg.jpg"];
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];

    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,
                                                                             64,
                                                                             self.view.bounds.size.width,
                                                                             self.view.bounds.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1.7*self.view.bounds.size.height);
    
    [self.imageView addSubview:scrollView];

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  self.view.bounds.size.width,
                                                                  2*self.view.bounds.size.height)
                                                      style:UITableViewStylePlain];
  
    scrollView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:self.tableView];
   
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
   
    headview = [[headView alloc]initWithFrame:CGRectMake(0,
                                                         0,
                                                         self.view.bounds.size.width,
                                                         [UIScreen mainScreen].bounds.size.height-113)];
    headview.todaymodel = self.weakmodel;
    headview.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headview;
    
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"weatherTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:weatherCellId];
    
}

- (void)changeCity{
   
    CityViewController *cityVC = [[CityViewController alloc]init];
   
//    [self presentViewController:cityVC animated:YES completion:nil];

    [self.navigationController pushViewController:cityVC animated:YES];
}


- (void)loadData{

    if (self.cityname == nil) {
        
        NSString *cityStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"city"];
        if (cityStr == nil) {
        
            self.cityname = @"杭州";
        
        }else{
            self.cityname = cityStr;
        
        }
        
        
    }
    
    NSString *ss = [self.cityname stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
   
    NSDictionary *parameters = @{@"cityname":ss};
    
    [self getData:kJHAPIS_LIFE_WEATHER_INDEX parameters:parameters];
    

}


- (void)getData:(NSString *)path  parameters:(NSDictionary *)parameters{
    
    JuheAPI *juheapi = [JuheAPI shareJuheApi];
    [juheapi executeWorkWithAPI:path
                     parameters:parameters
                        success:^(id responseObject){
                            if ([[parameters objectForKey:@"dtype"] isEqualToString:@"xml"]) {
                                NSLog(@"***xml*** \n %@", responseObject);
          
                                
                            }else{
                                int error_code = [[responseObject objectForKey:@"error_code"] intValue];
                                if (!error_code) {
                    
                               
                                    NSDictionary *dicresult = [responseObject objectForKey:@"result"];
                               
                                    
                                    
                                //today-----------------
                                    NSDictionary *dic       = [dicresult objectForKey:@"today"];
                               
                                    self.weakmodel = [[weatherModel alloc]initWithDataDic:dic];
                                    
                                    weatherLayoutFram *layoutfram = [[weatherLayoutFram alloc]init];
                                    layoutfram.weathermodel = self.weakmodel;
                                    
                                    
                                    NSDictionary *todatDic = [NSDictionary dictionaryWithObjectsAndKeys:layoutfram,@"today", nil];
                                    
                                    
                                    
                                    
                                [[NSNotificationCenter defaultCenter]postNotificationName:@"today" object:nil userInfo:todatDic];
                                   
                                 
                                //future----------------
                                    NSDictionary *futuredic = [dicresult objectForKey:@"future"];
                                   
                                    self.futureModelArray = [[NSMutableArray alloc]init];
                                    
                                    getKeyMethod *key = [[getKeyMethod alloc]init];
                                    
                                    NSMutableArray *dayKeyArray = [[NSMutableArray alloc]init];
                                    for (NSInteger i = 1; i<7; i++) {
                                        
                                        NSString *daykey = [key getkeyString:i];
                                        [dayKeyArray addObject:daykey];
                                        
                                    }
                                    
                                    
                                    for (NSInteger i = 0; i<6; i++) {
                                        
                                        NSDictionary *dicfuture  = [futuredic objectForKey:dayKeyArray[i]];
                                        
                                        futureModel *futuremodel = [[futureModel alloc]initWithDataDic:dicfuture];
                                        [self.futureModelArray addObject:futuremodel];
                                        
                                    }
                                   
                                    [self.tableView reloadData];
                                    
                                   
                                    
                                    
                                }else{
                                    NSLog(@"%@", responseObject);
                                }
                            }
                            
                        } failure:^(NSError *error) {
                            NSLog(@"error:   %@",error.description);
                        }];
}



#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    weatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:weatherCellId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[weatherTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:weatherCellId];
    }
    
    futureModel *model = self.futureModelArray[indexPath.row];
  
    cell.temperature.text = model.temperature;
    cell.weather.text     = model.weather;
    cell.date_t.text      = model.date;
    cell.week.text        = model.week;
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}




@end
