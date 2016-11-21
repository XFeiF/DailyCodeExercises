//
//  ViewController.m
//  HypnoNerd
//
//  Created by XFeiF on 2016/11/20.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

-(void)loadView{
    CGRect frame = [UIScreen mainScreen].bounds;
    
    // 创建第一个HypnosisView对象
    HypnosisView *backgroundView = [[HypnosisView alloc] init];
    
    CGRect textFieldRect = CGRectMake(frame.origin.x + frame.size.width/4, 70, frame.size.width/2, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // 设置UITextField对象的边框样式，便于查看它在屏幕上的位置
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

-(void)drawHypnoticMessage:(NSString *)message{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        CGSize viewSize = self.view.bounds.size;
        CGSize labelSize = messageLabel.bounds.size;
        int width = (int)(viewSize.width - labelSize.width);
        int x = arc4random() %width;
        
        int height = (int)(viewSize.height - labelSize.height);
        int y = arc4random() % height;
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc]
                        initWithKeyPath:@"center.x"
                        type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}

@end
