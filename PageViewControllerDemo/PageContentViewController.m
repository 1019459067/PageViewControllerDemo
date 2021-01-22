//
//  PageContentViewController.m
//  PageViewControllerDemo
//
//  Created by zhusanbao on 2020/1/14.
//  Copyright © 2020 zhusanbao. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@property (nonatomic, strong) UILabel *indexLabel;

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%256/255.0) green:(arc4random()%256/255.0) blue:(arc4random()%256/255.0) alpha:1];
    // Do any additional setup after loading the view.
    
    self.indexLabel = [[UILabel alloc] init];
    [self.view addSubview:self.indexLabel];
    self.indexLabel.font = [UIFont boldSystemFontOfSize:100];
    self.indexLabel.text = @(self.index).stringValue;
    self.indexLabel.textColor = [UIColor whiteColor];
//    CGFloat color = 10*self.index/255.f;
//    self.view.backgroundColor = [UIColor colorWithRed:color green:color blue:color alpha:1];
    [self.indexLabel sizeToFit];
    self.indexLabel.center = self.view.center;
}

- (void)dealloc {
    NSLog(@"\n---------\n%li>>>>>>>delloc\n---------\n",(long)self.index);
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"\n---------\n%li>>>>>>>viewWillAppear\n---------\n",(long)self.index);
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    NSLog(@"\n---------\n%li>>>>>>>viewWillDisappear\n---------\n",(long)self.index);
//}

//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    NSLog(@"\n---------\n%li>>>>>>>viewDidDisappear\n---------\n",(long)self.index);
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    NSLog(@"\n---------\n%li>>>>>>>viewDidAppear\n---------\n",(long)self.index);
//}

@end
