//
//  ViewController.m
//  Masonry
//
//  Created by mac on 16/3/24.
//  Copyright © 2016年 lwx. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self viewMasonry];
    [self scrollViewMasonry];
    
}

- (void)scrollViewMasonry{
    
    UIScrollView *scroll = [UIScrollView new];
    scroll.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scroll];
    
    [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.size.mas_equalTo(self.view).sizeOffset(CGSizeMake(-20, -20));
        
    }];
    
    
    UILabel *lastLable;
    
    for (NSInteger i = 0; i < 20; i++) {
        
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0  blue:arc4random()%256/255.0  alpha:1];
        label.text = [NSString stringWithFormat:@"%ld",(long)i];
        [scroll addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.equalTo(scroll);
            make.left.equalTo(scroll);
            
            make.height.equalTo(@(arc4random()%50 + 100));
            
            
            if (lastLable) {
                
                make.top.equalTo(lastLable.mas_bottom);
                
            }else{
                make.top.equalTo(scroll);
            }
            
        }];
        
        lastLable = label;
    }
    
    [scroll mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(lastLable);
        
    }];
    
    
}

- (void)viewMasonry {
    
    UIView *topView = [UIView new];
    topView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@64);
    }];
    
    
    UIView *topView1 = [UIView new];
    topView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:topView1];
    
    [topView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(topView).insets(UIEdgeInsetsMake(10, 0, 10, 10));
        make.width.equalTo(@40);
    }];
    
    UIView *centerView = [UIView new];
    centerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:centerView];
    
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.left.equalTo(self.view).offset(10);
        //        make.height.equalTo(centerView.mas_width);
        make.top.equalTo(topView.mas_bottom).offset(20);
        
    }];
    
    UIView *centerView1 = [UIView new];
    centerView1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:centerView1];
    
    [centerView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.right.equalTo(centerView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];

}

@end
