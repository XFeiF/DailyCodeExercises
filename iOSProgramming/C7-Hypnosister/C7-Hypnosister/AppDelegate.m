//
//  AppDelegate.m
//  C7-Hypnosister
//
//  Created by XFeiF on 2016/11/21.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"
#import "ViewController.h"
@interface AppDelegate ()<UIScrollViewDelegate>

@property (nonatomic) HypnosisView *hyposisView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen]bounds]];
    
    ViewController *controller = [[ViewController alloc] init];
    [self.window setRootViewController:controller];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    // P117
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    
    // 创建一个UISCrollView对象，将其尺寸设置为窗口大小
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    [scrollView setPagingEnabled:NO];
    scrollView.delegate = self;
    
    [self.window addSubview:scrollView];
    
    // 创建一个大小与屏幕相同的HypnosisView对象并将其加入UIScrollView对象
    _hyposisView = [[HypnosisView alloc]
                                 initWithFrame:screenRect];
    [scrollView addSubview:_hyposisView];
    
    // 告诉UIScrollView对象“取景”范围有多大
    scrollView.contentSize = screenRect.size;
    scrollView.maximumZoomScale = 4.0;
    
    return YES;
}

-(HypnosisView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    //scrollView.minimumZoomScale = 1.0;
    //scrollView.maximumZoomScale = 4.0;
    return self.hyposisView;
}

@end
