//
//  ViewController.m
//  PageViewControllerDemo
//
//  Created by zhusanbao on 2020/1/14.
//  Copyright © 2020 zhusanbao. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"

@interface ViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSArray *pageContentArray;

@end

@implementation ViewController

#pragma mark - Lazy Load

- (NSArray *)pageContentArray {
    if (!_pageContentArray) {
        NSMutableArray *arrayM = [[NSMutableArray alloc] init];
        for (int i = 1; i < 10; i++) {
            [arrayM addObject:@(i)];
        }
        _pageContentArray = [[NSArray alloc] initWithArray:arrayM];

    }
    return _pageContentArray;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置UIPageViewController的配置项
//    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey : @(20)};
    NSDictionary *options = @{UIPageViewControllerOptionSpineLocationKey : @(UIPageViewControllerSpineLocationNone)};

    // 根据给定的属性实例化UIPageViewController
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationVertical
                                                                        options:options];
    // 设置UIPageViewController代理和数据源
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    // 设置UIPageViewController初始化数据, 将数据放在NSArray里面
    // 如果 options 设置了 UIPageViewControllerSpineLocationMid,注意viewControllers至少包含两个数据,且 doubleSided = YES
    
    PageContentViewController *initialViewController = [self viewControllerAtIndex:0];// 得到第一页
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageViewController setViewControllers:viewControllers
                              direction:UIPageViewControllerNavigationDirectionReverse
                               animated:NO
                             completion:nil];

    // 设置UIPageViewController 尺寸
    self.pageViewController.view.frame = self.view.bounds;

    // 在页面上，显示UIPageViewController对象的View
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

}

#pragma mark - UIPageViewControllerDataSource And UIPageViewControllerDelegate

#pragma mark 返回上一个ViewController对象

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(PageContentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    // 返回的ViewController，将被添加到相应的UIPageViewController对象上。
    // UIPageViewController对象会根据UIPageViewControllerDataSource协议方法,自动来维护次序
    // 不用我们去操心每个ViewController的顺序问题
    return [self viewControllerAtIndex:index];
    
    
}

#pragma mark 返回下一个ViewController对象

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(PageContentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.pageContentArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
    
    
}

#pragma mark - 根据index得到对应的UIViewController

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.pageContentArray count] == 0) || (index >= [self.pageContentArray count])) {
        return nil;
    }
    // 创建一个新的控制器类，并且分配给相应的数据
    PageContentViewController *contentVC = [[PageContentViewController alloc] init];
    contentVC.index = [[self.pageContentArray objectAtIndex:index] intValue];
    return contentVC;
}

#pragma mark - 数组元素值，得到下标值

- (NSUInteger)indexOfViewController:(PageContentViewController *)viewController {
    return [self.pageContentArray indexOfObject:@(viewController.index)];
}

@end
