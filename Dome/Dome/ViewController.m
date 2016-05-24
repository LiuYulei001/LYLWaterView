//
//  ViewController.m
//  Dome
//
//  Created by SPI-绿能宝 on 16/5/24.
//  Copyright © 2016年 北京SPI绿能宝. All rights reserved.
//

#import "ViewController.h"
#import <LYLWaterView/DoubleWaterView.h>

@interface ViewController ()
@property (nonatomic,strong) DoubleWaterView *waterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.waterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - getter
- (DoubleWaterView *)waterView{
    if (!_waterView) {
        _waterView = [[DoubleWaterView alloc] initWithFrame:self.view.bounds];
        _waterView.percentNum = 0.5;
    }
    return _waterView;
}
@end
