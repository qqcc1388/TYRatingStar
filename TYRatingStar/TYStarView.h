//
//  TYStarView.h
//  TYRatingStar
//
//  Created by tiny on 16/8/1.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYStarView : UIView


/**
 *  0 - 5.f
 */
@property (nonatomic,assign)CGFloat progress;

/**
 *  默认星星间距为 5.f
 */
@property (nonatomic,assign)CGFloat starMargin;

/**
 *  是否开启手势拖动 默认开启
 */
@property (nonatomic,assign,getter=isEnableTouchEvent)BOOL enableTouchEvent;



@end
