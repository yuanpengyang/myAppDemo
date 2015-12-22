//
//  MemorandumCell.m
//  MyApp
//
//  Created by Alan on 15/12/3.
//  Copyright © 2015年 Abel. All rights reserved.
//

#import "MemorandumCell.h"

@implementation MemorandumCell

- (void)awakeFromNib {
    
//    self.finishButton.tag = 101;
//    [self.finishButton addTarget:self action:@selector(clink:) forControlEvents:UIControlEventTouchUpInside];
//     [self.finishButton setTitle:@"未完成" forState:UIControlStateNormal];
//   
    
}



- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        
    }
    return self;
}


//- (void)clink:(UIButton*)btn{
//    if (btn.tag == 101) {
//        self.finishButton.tag = 102;
//        [self.finishButton setTitle:@"完成" forState:UIControlStateNormal];
//        
//    }else if(btn.tag == 102){
//    
//        self.finishButton.tag = 101;
//       [self.finishButton setTitle:@"未完成" forState:UIControlStateNormal];
//    
//    }
//    NSLog(@"%li",self.finishButton.tag);
//
//}

- (void)layoutSubviews{
    [super layoutSubviews];
  
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
