//
//  DetialTableViewController.m
//  MyApp
//
//  Created by Alan on 15/12/16.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "AddGroupViewController.h"

#define kscreenwidth self.view.bounds.size.width
#define kscreenheight self.view.bounds.size.height

@interface AddGroupViewController ()

@end

@implementation AddGroupViewController

- (void)viewDidAppear:(BOOL)animated{
    
  //  [self.tableView setFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height)];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                          0,
                                                                          kscreenwidth,
                                                                          kscreenheight)];
    imageView.image = [UIImage imageNamed:@"mask_bg.jpg"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    

    
    //    self.tableView.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
    
    self.addgroupTable = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                                                        100,
                                                                               kscreenwidth,
                                                                              kscreenheight)];
    
    [self.view addSubview:self.addgroupTable];
    self.addgroupTable.backgroundColor = [UIColor clearColor];
    self.addgroupTable.delegate = self;
    self.addgroupTable.dataSource = self;
    self.addgroupTable.rowHeight = 90;
    self.addgroupTable.allowsSelection = NO; // We essentially implement our own selection
    self.addgroupTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); // Makes the horizontal row seperator stretch the entire length of the table view
    
    
}







#pragma mark - Table view data source

- (void)finishClink{
    
    NSLog(@"finish");
    NSString *groupName = textfield.text;
    NSLog(@"name %@",groupName);
    if (groupName != nil && ![groupName  isEqual: @""]) {
       
        NSMutableArray *initNoteArray = [[NSMutableArray alloc]init];
        if ([[NSUserDefaults standardUserDefaults]objectForKey:@"group"] == nil) {
            [[NSUserDefaults standardUserDefaults]setObject:initNoteArray forKey:@"group"];
        }
        
        NSArray *tempArray = [[NSUserDefaults standardUserDefaults]objectForKey:@"group"];
        
        NSMutableArray *mutabArray = [tempArray mutableCopy];
        [mutabArray addObject:groupName];
        [[NSUserDefaults standardUserDefaults]setObject:mutabArray forKey:@"group"];
        
    }
   
    
    
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
    
}

#pragma mark UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kscreenwidth, 50)];
    
    //view.backgroundColor = [UIColor yellowColor];
    textfield = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kscreenwidth-100, 50)];
    [view addSubview:textfield];
    textfield.backgroundColor = [UIColor grayColor];
    
    textfield.placeholder = @"新建列表";
    
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    finishButton.frame = CGRectMake(kscreenwidth-80, 20, 50, 20);
    [finishButton setTitle:@"完成" forState:UIControlStateNormal];
    [view addSubview:finishButton];
    
    view.userInteractionEnabled = YES;
    finishButton.backgroundColor = [UIColor redColor];
    [finishButton addTarget:self action:@selector(finishClink) forControlEvents:UIControlEventTouchUpInside];
    
    return  view;
    
    
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
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
                                  containingTableView:self.addgroupTable // Used for row height and selection
                                   leftUtilityButtons:leftUtilityButtons
                                  rightUtilityButtons:rightUtilityButtons];
        cell.delegate = self;
        
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
            NSLog(@"left btton 3 was pressed");
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
            NSIndexPath *cellIndexPath = [self.addgroupTable indexPathForCell:cell];
            
           // [_testArray removeObjectAtIndex:cellIndexPath.row];
            [self.addgroupTable deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
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
