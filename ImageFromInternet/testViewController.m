//
//  testViewController.m
//  ImageFromInternet
//
//  Created by 方舟 on 15/5/12.
//  Copyright (c) 2015年 方舟. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *testView;

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.testView];
}

-(UIImageView *)testView
{
    _testView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://d.hiphotos.baidu.com/zhidao/pic/item/10dfa9ec8a136327e1d55f43918fa0ec08fac782.jpg"]]];
    [_testView sizeToFit];
    return _testView;
}

@end
