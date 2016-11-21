//
//  Hypnosister.m
//  Hypnosister
//
//  Created by XFeiF on 2016/11/17.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "HypnosisView.h"

// chapter 5 start
@interface HypnosisView()

@property (strong,nonatomic) UIColor *circleColor;

- (void)mainSegmentControl:(UISegmentedControl *)segment;


@end
// chapter 5 end


@implementation HypnosisView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置HypnosisView对象的背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
        
        // chapter 5
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

// chapter 5
// HypnosisView 被触摸时会受到该消息
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //[super touchesBegan:touches withEvent:event];

    //NSLog(@"%@ was touched", self);
    
    // 获取3个0到1之间的数字
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) /100.0;
    float blue = (arc4random() % 100) / 100.0;
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    self.circleColor = randomColor;
}

-(void) setCircleColor:(UIColor *)circleColor{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    // 根据bounds计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // 使最外层的圆成为视图的外接圆
    float maxRadius = hypotf(bounds.size.width, bounds.size.height)/2.0;
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI*2
                     clockwise:YES];
    }
    
    
    path.lineWidth = 10;
    
    //[[UIColor lightGrayColor] setStroke];
    
    // Chapter 5
    [self.circleColor setStroke];
    
    [path stroke];
    
    
}


// mainSegmentControl: 方法用来接受 UISegmentedControl 发的消息
- (void)mainSegmentControl:(UISegmentedControl *)segment
{
    
    if(segment.selectedSegmentIndex == 0)
    {
        // action for the first button (Current or Default)
        self.circleColor = [UIColor redColor];
    }
    else if(segment.selectedSegmentIndex == 1)
    {
        // action for the second button
        self.circleColor = [UIColor greenColor];
    }
    else if(segment.selectedSegmentIndex == 2)
    {
        // action for the third button
        self.circleColor = [UIColor blueColor];
    }
    
}


@end
