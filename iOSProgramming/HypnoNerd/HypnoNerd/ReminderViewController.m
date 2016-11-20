//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by XFeiF on 2016/11/21.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation ReminderViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

-(IBAction)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"Settinh a reminder for %@", date);
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        // 获取tabBarItem属性所指向的UITabBarItem对象
        UITabBarItem * tbi = self.tabBarItem;
        
        // 设置标签页的标题
        tbi.title = @"Reminder";
        
        // 从图像文件中创建一个UIImage对象
        UIImage *i = [UIImage imageNamed:@"Time"];
        
        // 将UIImage对象赋给标签页的image属性
        tbi.image = i;
    }
    return self;
}

-(void)viewDidLoad{
    // 必须调用父类的viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"ReminderViewController loaded its view");
}
@end
