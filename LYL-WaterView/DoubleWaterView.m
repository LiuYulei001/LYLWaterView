//
//  DoubleWaterView.m
//  WaterView
//
//  Created by SPI-绿能宝 on 16/4/7.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#define SNOW_IMAGENAME         @"泡.png"

#define PercentageNUM_lab_FONT 55

#define IMAGE_X                arc4random()%(int)Main_Screen_Width
#define IMAGE_ALPHA            ((float)(arc4random()%10))/10
#define IMAGE_WIDTH            arc4random()%20 + 10
#define PLUS_HEIGHT            Main_Screen_Height/25


#define kWaterViewColler kBorderLineColler
#define kWaterView1Coller kBorderLineColler

#import "DoubleWaterView.h"

#import "WaterView.h"

#import "UConstants.h"


@interface DoubleWaterView ()
{
    NSMutableArray *_imagesArray;
}
@property (nonatomic,strong) WaterView *waterView;
@property (nonatomic,strong) WaterView *waterView1;

@property(nonatomic,strong)UILabel *PercentageNUM_lab;

@end

@implementation DoubleWaterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.waterView];
        [self addSubview:self.waterView1];
        [self addSubview:self.PercentageNUM_lab];
        
        
        _imagesArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 7; ++ i) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:IMAGENAMED(SNOW_IMAGENAME)];
            float x = IMAGE_WIDTH;
            imageView.frame = CGRectMake(IMAGE_X, Main_Screen_Height, x, x);
            imageView.alpha = IMAGE_ALPHA;
            [self addSubview:imageView];
            [_imagesArray addObject:imageView];
        }
        [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(makeSnow) userInfo:nil repeats:YES];
        
        [self bringSubviewToFront:self.PercentageNUM_lab];

    }
    return self;
}

- (WaterView *)waterView{
    if (!_waterView) {
        _waterView = [[WaterView alloc] init];
        self.waterView.frame = self.bounds;
        _waterView.backgroundColor = [UIColor whiteColor];
        _waterView.alpha = 0.8;
        _waterView.currentWaterColor = kWaterViewColler;
        _waterView.isLR = YES;
    }
    return _waterView;
}
- (WaterView *)waterView1{
    if (!_waterView1) {
        _waterView1 = [[WaterView alloc] init];
        self.waterView1.frame = self.bounds;
        _waterView1.backgroundColor = [UIColor whiteColor];
        _waterView1.alpha = 0.63;
        _waterView1.currentWaterColor = kWaterView1Coller;
        _waterView1.isLR = NO;
    }
    return _waterView1;
}
-(void)setPercentNum:(CGFloat)percentNum
{
    _percentNum = percentNum;
    self.PercentageNUM_lab.text = [NSString stringWithFormat:@"%.0f %%",(percentNum*100)];
    
    self.waterView.percentNum = percentNum;
    self.waterView1.percentNum = percentNum;
    
}

static int i = 0;
- (void)makeSnow
{
    i = i + 1;
    if ([_imagesArray count] > 0) {
        UIImageView *imageView = [_imagesArray objectAtIndex:0];
        imageView.tag = i;
        [_imagesArray removeObjectAtIndex:0];
        [self snowFall:imageView];
    }
    
}

- (void)snowFall:(UIImageView *)aImageView
{
    [UIView beginAnimations:[NSString stringWithFormat:@"%li",(long)aImageView.tag] context:nil];
    [UIView setAnimationDuration:6];
    [UIView setAnimationDelegate:self];
    aImageView.frame = CGRectMake(aImageView.frame.origin.x, self.bounds.size.height * (1.0f - self.percentNum), aImageView.frame.size.width, aImageView.frame.size.height);
    [UIView commitAnimations];
    
} 
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    UIImageView *imageView = (UIImageView *)[self viewWithTag:[animationID intValue]];
    float x = IMAGE_WIDTH;
    imageView.frame = CGRectMake(IMAGE_X, Main_Screen_Height, x, x);
    [_imagesArray addObject:imageView];
}
-(UILabel *)PercentageNUM_lab
{
    if (!_PercentageNUM_lab) {
        
        _PercentageNUM_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 80)];
        _PercentageNUM_lab.center = self.center;
        _PercentageNUM_lab.textAlignment = NSTextAlignmentCenter;
        _PercentageNUM_lab.font = [UIFont systemFontOfSize:PercentageNUM_lab_FONT];
        _PercentageNUM_lab.textColor = kOrangeColler;
        
    }
    return _PercentageNUM_lab;
}

@end
