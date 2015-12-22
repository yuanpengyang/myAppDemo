//
//  DetialTableViewController.m
//  MyApp
//
//  Created by Alan on 15/12/16.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "DetialViewController.h"

#define kscreenwidth self.view.bounds.size.width
#define kscreenheight self.view.bounds.size.height

@interface DetialViewController ()

@end

@implementation DetialViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubView];
}


- (void)createSubView{

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                          0,
                                                                          kscreenwidth,
                                                                          kscreenheight)];
    //imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"mask_bg.jpg"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    self.detailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                                        100,
                                                                        kscreenwidth,
                                                                        kscreenheight)];
    
    [self.view addSubview:self.detailTableView];
    self.detailTableView.backgroundColor = [UIColor clearColor];
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
    self.detailTableView.rowHeight = 90;
    self.detailTableView.allowsSelection = NO;
    self.detailTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    groupArray = [[NSMutableArray alloc]init];
    groupArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"group"];
    detailArray = [[NSMutableArray alloc]init];
    
    titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    titleButton.frame = CGRectMake(0, 0, kscreenwidth-100, 50);
    [titleButton setTitle:groupArray[self.index] forState:UIControlStateNormal];
    
    
    titleButton.backgroundColor = [UIColor grayColor];
    
    [titleButton addTarget:self action:@selector(titleClink) forControlEvents:UIControlEventTouchUpInside];
    


}

- (void)viewWillAppear:(BOOL)animated{
     NSLog(@"buttton%@",titleButton.titleLabel.text);
    
   
    //取data
    detailArray = [[NSUserDefaults standardUserDefaults]objectForKey:titleButton.titleLabel.text];
    
   
   
    [self.detailTableView reloadData];
}




#pragma mark - Table view data source

- (void)addClink{
    
    NSLog(@"add");
    

    
    AddDetailViewController *adddetailVC = [[AddDetailViewController alloc]initWithNibName:@"AddDetailViewController"
                       bundle:nil];
    adddetailVC.groupName = titleButton.titleLabel.text;
    [self presentViewController:adddetailVC animated:NO completion:^{
        
    }];
    

    
    
}


- (void)deleteClink{

    NSLog(@"delete");
    
    NSArray *temp = [[NSUserDefaults standardUserDefaults]objectForKey:@"group"];
    
    NSMutableArray *mutablearray = [temp mutableCopy];
    
    [mutablearray removeObjectAtIndex:self.index];
    
    [[NSUserDefaults standardUserDefaults]setObject:mutablearray forKey:@"group"];
    
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];


}

- (void)titleClink{

    
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}

- (void)setProgramForCell:(SWTableViewCell *)cell{
    
  
    
    
    SetDetailViewController *setdetailVC = [[SetDetailViewController alloc]init];
    SetDetailNavController *navi = [[SetDetailNavController alloc]initWithRootViewController:setdetailVC];
    setdetailVC.detailName = cell.textLabel.text;
    setdetailVC.groupName  = titleButton.titleLabel.text;
    
    [self presentViewController:navi animated:YES completion:nil];
    
}


#pragma mark UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kscreenwidth, 50)];
    
 

    [view addSubview:titleButton];
    
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(kscreenwidth-80, 30, 50, 20);
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    [view addSubview:addButton];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteButton.frame = CGRectMake(kscreenwidth-80, 0, 50, 20);
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [view addSubview:deleteButton];
    
    
    view.userInteractionEnabled = YES;
    addButton.backgroundColor = [UIColor redColor];
    deleteButton.backgroundColor = [UIColor greenColor];
    [addButton addTarget:self action:@selector(addClink) forControlEvents:UIControlEventTouchUpInside];
    [deleteButton addTarget:self action:@selector(deleteClink) forControlEvents:UIControlEventTouchUpInside];
    return  view;
    
    
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return detailArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell selected at index path %ld", (long)indexPath.row);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        NSMutableArray *leftUtilityButtons = [NSMutableArray new];
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        
        [leftUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                 icon:[UIImage imageNamed:@"check.png"]];
        [leftUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                 icon:[UIImage imageNamed:@"clock.png"]];
        [leftUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                 icon:[UIImage imageNamed:@"cross.png"]];
        [leftUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                 icon:[UIImage imageNamed:@"list.png"]];
        
        [rightUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                 title:@"More"];
        [rightUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                 title:@"Delete"];
        
        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier
                                  containingTableView:self.detailTableView // Used for row height and selection
                                   leftUtilityButtons:leftUtilityButtons
                                  rightUtilityButtons:rightUtilityButtons];
        cell.delegate = self;
    }
    
    if (detailArray.count != 0) {
        cell.textLabel.text = detailArray[indexPath.row];
        cell.detailTextLabel.text = @"Some detail text";
    }
    
    
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scroll view did begin dragging");
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set background color of cell here if you don't want white
}

#pragma mark - SWTableViewDelegate

- (void)swippableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"left button 0 was pressed");
            break;
        case 1:
            NSLog(@"left button 1 was pressed");
            break;
        case 2:
            NSLog(@"left button 2 was pressed");
            break;
        case 3:
            NSLog(@"left btton set was pressed");
            
            [self setProgramForCell:cell];
            
            break;
            
        default:
            break;
    }
}



- (void)swippableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            NSLog(@"More button was pressed");
            UIAlertView *alertTest = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"More more more" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles: nil];
            [alertTest show];
            
            [cell hideUtilityButtonsAnimated:YES];
            break;
        }
        case 1:
        {
            // Delete button was pressed
            
            
            NSMutableArray *temp = [detailArray mutableCopy];
//            [temp removeObjectAtIndex:index];
            NSIndexPath *cellIndexPath = [self.detailTableView indexPathForCell:cell];
            [temp removeObjectAtIndex:cellIndexPath.row];
            [[NSUserDefaults standardUserDefaults]setObject:temp forKey:titleButton.titleLabel.text];
            
            
            
            
            detailArray = temp;
           [self.detailTableView deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
           
           // [self.tableView reloadData];
            
            
            
            break;
        }
        default:
            break;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end
