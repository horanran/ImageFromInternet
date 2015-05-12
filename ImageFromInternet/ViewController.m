//
//  ViewController.m
//  ImageFromInternet
//
//  Created by 方舟 on 15/5/11.
//  Copyright (c) 2015年 方舟. All rights reserved.
//

#import "ViewController.h"
#import "imageShowViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[imageShowViewController class]]){
        imageShowViewController *isvc = (imageShowViewController *)segue.destinationViewController;
        if ([segue.identifier isEqualToString:@"初号机"]) {
            isvc.imageUrl = [NSURL URLWithString:@"http://d.hiphotos.baidu.com/zhidao/pic/item/10dfa9ec8a136327e1d55f43918fa0ec08fac782.jpg"];
        }
        else if([segue.identifier isEqualToString:@"二号机"]){
            isvc.imageUrl = [NSURL URLWithString:@"http://imgsrc.baidu.com/forum/pic/item/793fa8d3da87f609970a1693.jpg"];
        }
        else if([segue.identifier isEqualToString:@"零号机"]){
            isvc.imageUrl = [NSURL URLWithString:@"http://upload.shunwang.com/2013/1108/1383880067695.jpg"];
        }
        isvc.title = segue.identifier;
    }
}

@end
