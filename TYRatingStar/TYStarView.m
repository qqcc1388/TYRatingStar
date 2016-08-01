//
//  TYStarView.m
//  TYRatingStar
//
//  Created by tiny on 16/8/1.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "TYStarView.h"

@interface TYStarView ()

@property (nonatomic,strong)UIView  *backgroundStar;  //背景star
@property (nonatomic,strong)UIView *forgroundStar;    //前景star
@end

@implementation TYStarView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    _progress = 1.0f;
    _starMargin = 5.0f;
    self.clipsToBounds = YES;
    _enableTouchEvent = YES;
    
    //初始化UI
    self.backgroundStar = [[UIView alloc] init];
    self.backgroundStar.backgroundColor = [UIColor clearColor];
    [self addSubview:self.backgroundStar];
    
    //创建5颗星星
    for (int i = 0; i < 5 ; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:@"back"];
        [self.backgroundStar addSubview:imgView];
    }
    
    self.forgroundStar = [[UIView alloc] init];
//    self.forgroundStar.backgroundColor = [UIColor greenColor];
    self.forgroundStar.clipsToBounds = YES;
    [self addSubview:self.forgroundStar];
    
    for (int i = 0; i < 5 ; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:@"fore"];
        [self.forgroundStar addSubview:imgView];
    }
    
}

-(void)resetTYStarFrame
{
    //重新设置frame
    self.backgroundStar.frame = self.bounds;
    //重新设置值
    CGRect forgroundStarFrame = self.bounds;
    forgroundStarFrame.size.width*=self.progress;
    self.forgroundStar.frame = forgroundStarFrame;
    
    [self layoutMySubViews:self.forgroundStar Count:self.forgroundStar.subviews.count];
    
    [self layoutMySubViews:self.backgroundStar Count:self.backgroundStar.subviews.count];
    
}

-(void)layoutMySubViews:(UIView *)mySuperView Count:(NSInteger)count
{
    if (count <5) {
        return;
    }
    //设置星星的frame
    CGFloat margin = self.starMargin;
    CGFloat starW = (self.bounds.size.width - margin*(count - 1))/(count *1.0);
    CGFloat starH = starW;
    for (int i = 0; i < count; i ++) {
        UIView *view = mySuperView.subviews[i];
        if ([view isKindOfClass:[UIImageView class]]) {
            UIImageView *imgView = (UIImageView *)view;
            imgView.frame = CGRectMake(i*(margin+starW), (self.bounds.size.height - starH)*0.5, starW, starH);
        }
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self resetTYStarFrame];
}


-(void)setProgress:(CGFloat)progress
{
    
    /**
     *  0 - 5 映射到 0 - 1
     */
    _progress = progress*0.2;
    if (_progress <=0) {
        _progress = 0;
    }
    if (_progress >=1.0) {
        _progress = 1.0;
    }
    [self setNeedsLayout];
    
}

-(void)setEnableTouchEvent:(BOOL)enableTouchEvent
{
    _enableTouchEvent = enableTouchEvent;
    self.userInteractionEnabled = enableTouchEvent;
}

#pragma mark - 提供手势支持
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.enableTouchEvent) {
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    _progress = currentPoint.x/self.bounds.size.width;
    [self setNeedsLayout];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.enableTouchEvent) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    _progress = currentPoint.x/self.bounds.size.width;
    [self setNeedsLayout];
}



@end
