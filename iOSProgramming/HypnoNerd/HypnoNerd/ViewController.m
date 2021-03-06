//
//  ViewController.m
//  HypnoNerd
//
//  Created by XFeiF on 2016/11/20.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    // 创建第一个HypnosisView对象
    HypnosisView *backgroundView = [[HypnosisView alloc] init];
    
    self.view = backgroundView;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        // 设置标签页的标题
        self.tabBarItem.title = @"Hypnotize";
        
        // 从图像文件中创建一个UIImage对象
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // 将UIImage对象赋给标签页的image属性
        self.tabBarItem.image = i;
    }
    return self;
}

-(void)viewDidLoad{
    // 必须调用父类的viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view");
    
    // 初始化UISegmentedControl，设置大小和颜色
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];
    segmentedControl.frame = CGRectMake(0, 0, 250, 50);
    segmentedControl.tintColor = [UIColor blackColor];
    
    // 注册UISegmentedControl
    [segmentedControl addTarget:self.view
                         action:@selector(mainSegmentControl:)
               forControlEvents: UIControlEventValueChanged];
    // 添加到视图
    [self.view addSubview:segmentedControl];
    
}

@end
