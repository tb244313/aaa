
//
//  DanMuView.m
//  弹幕效果
//
//  Created by apple on 16/11/17.
//  Copyright © 2016年 51talk. All rights reserved.
//

#import "DanMuView.h"

@interface DanMuView ()
@property (nonatomic, assign) CGFloat imageX;

@end
@implementation DanMuView

/**
 当控件从xib/sb中创建是会调用
 */
-(void)awakeFromNib
{

    self.imageX = 375;

    [self addTimer];
}
//绘制内容到这个view上面

/**
 不能直接调用（系统自动调用，每次调用该方法会将上一次绘制的内容清空）
 */
- (void)drawRect:(CGRect)rect
{
    //加载图片
    UIImage *image = [UIImage imageNamed:@"oscillogram_4@2x"];

    
    //绘制图片
    [image drawAtPoint:CGPointMake(self.imageX, 10)];
    
}
#pragma mark-添加定时器
-(void)addTimer
{
    //每秒执行60次回调方法
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTimer)];

    //将定时器添加到RunLoop
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

/**
 定时器的回调方法
 */
-(void)updateTimer{


    NSLog(@"%s",__FUNCTION__);
    self.imageX -= 1;
    //通知重新绘制
    [self setNeedsDisplay];
}
@end
