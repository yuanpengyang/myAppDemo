//
//  RightViewController.m
//  MyApp
//
//  Created by Alan on 15/12/2.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubView];
 
    
}

- (void)createSubView{
    
  
    headImage = [UIButton buttonWithType:UIButtonTypeCustom];
    headImage.frame = CGRectMake(70, 50, 100, 100);
    [self.view addSubview:headImage];
    
    [headImage setBackgroundImage:[UIImage imageNamed:@"huitailang.png"]  forState:UIControlStateNormal];
  
    [headImage addTarget:self action:@selector(_selectPhoto) forControlEvents:UIControlEventTouchUpInside];
   
    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.frame = CGRectMake(70, 220+i*40, 100, 30);
        button.backgroundColor = [UIColor grayColor];
        [self.view addSubview:button];
        if (i == 0) {
            [button setTitle:@"账户管理" forState:UIControlStateNormal];
        }
        if (i == 1) {
            [button setTitle:@"个人信息" forState:UIControlStateNormal];
        }
        if (i == 2) {
            [button setTitle:@"设置" forState:UIControlStateNormal];
        }
    }
}







#pragma mark - 选择照片
- (void)_selectPhoto{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
    
    [actionSheet showInView:self.view];
    
    //UIImagePickerController
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    
    UIImagePickerControllerSourceType sourceType;
    //选择相机 或者 相册
    if (buttonIndex == 0) {//拍照
        
        sourceType = UIImagePickerControllerSourceTypeCamera;
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCamera) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"摄像头无法使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alert show];
            
            return;
        }
        
        
    }else if(buttonIndex == 1){ //选择相册
        
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
    }else{
        
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}
//照片选择代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //弹出相册控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    //2 取出照片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    
    [headImage setBackgroundImage:image forState:UIControlStateNormal];
    
}




@end
