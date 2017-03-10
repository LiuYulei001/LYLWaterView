//
//  WaterView.h
//  WaterView
//
//  Created by MyMac on 15/10/29.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterView : UIView

@property (nonatomic,assign) CGFloat percentNum;

@property (nonatomic,strong) UIColor *currentWaterColor;

@property(nonatomic)BOOL isLR;


@end
