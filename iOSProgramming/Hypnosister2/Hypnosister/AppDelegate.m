//
//  AppDelegate.m
//  Hypnosister
//
//  Created by XFeiF on 2016/11/17.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen]bounds]];
    
    ViewController *controller = [[ViewController alloc] init];
    [self.window setRootViewController:controller];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    /*  
     P116
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    
    // 创建一个UISCrollView对象，将其尺寸设置为窗口大小
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    
    
    // 创建一个有超大尺寸的HypnosisView对象并将其加入UIScrollView对象
    HypnosisView *hyposisView = [[HypnosisView alloc]
                               initWithFrame:bigRect];
    [scrollView addSubview:hyposisView];
    
    [self.window addSubview:scrollView];
    
    // 告诉UIScrollView对象“取景”范围有多大
    scrollView.contentSize = bigRect.size;
    */
    
    
    // P117
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    
    // 创建一个UISCrollView对象，将其尺寸设置为窗口大小
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    [scrollView setPagingEnabled:YES];
    [self.window addSubview:scrollView];
    
    // 创建一个大小与屏幕相同的HypnosisView对象并将其加入UIScrollView对象
    HypnosisView *hyposisView = [[HypnosisView alloc]
                                 initWithFrame:screenRect];
    [scrollView addSubview:hyposisView];
    
    // 创建第二个与屏幕相同的HypnosisView对象并放置在第一个HypnosisView对象的右侧
    // 使其刚好移除屏幕外
    screenRect.origin.x += screenRect.size.width;
    HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];
    
    
    // 告诉UIScrollView对象“取景”范围有多大
    scrollView.contentSize = bigRect.size;

     
     
    return YES;
}

@end
