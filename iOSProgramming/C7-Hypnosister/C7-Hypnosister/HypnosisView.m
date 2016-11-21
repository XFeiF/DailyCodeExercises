//
//  Hypnosister.m
//  Hypnosister
//
//  Created by XFeiF on 2016/11/17.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView()

@property (strong,nonatomic) UIColor *circleColor;

@end

@implementation HypnosisView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置HypnosisView对象的背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
        
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

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
    
    [self.circleColor setStroke];
    
    [path stroke];
    
    
}




@end
