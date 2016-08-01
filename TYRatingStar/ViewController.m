//
//  ViewController.m
//  TYRatingStar
//
//  Created by tiny on 16/8/1.
//  Copyright © 2016年 tiny. All rights reserved.
//

#import "ViewController.h"
#import "TYStarView.h"

@interface ViewController ()
@property (nonatomic,strong)TYStarView *starView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TYStarView *starView = [[TYStarView alloc] initWithFrame:CGRectMake(50, 50, 200,40)];
    self.starView = starView;
    [self.view addSubview:starView];
    starView.enableTouchEvent = NO;
    starView.progress = 3.f;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
