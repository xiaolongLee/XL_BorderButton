//
//  ViewController.m
//  UIButton_Border
//
//  Created by yuanshi on 2020/6/4.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+EdgeInsets.h"
#import "UIButton+SmsVerification.h"
#import "UIView+DirectionBorder.h"
@interface ViewController ()
@property (nonatomic,strong)  UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 100, 100, 100);
    [self.view addSubview:btn];
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.btn = btn;
//    self.btn = (UIButton *)[self.btn borderForView:self.btn color:[UIColor redColor] borderWidth:1 borderType:UIButtonBorderSideTypeTop];
//
    [self.btn setDirectionBorderWithTop:NO left:YES bottom:NO right:NO borderColor:[UIColor redColor] withBorderWidth:1];
    
//    self.btn = (UIButton *)[self.btn borderForColor:[UIColor blueColor] borderWidth:1 borderType:UIBorderSideTypeBottom];
}


@end
