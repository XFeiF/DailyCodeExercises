//
//  Hypnosister.m
//  Hypnosister
//
//  Created by XFeiF on 2016/11/17.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置HypnosisView对象的背景颜色为透明
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    // 根据bounds计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    /*
    // 根据视图宽和高中较小值计算圆形的半径
    float radius = (MIN(bounds.size.height, bounds.size.width) / 2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI*2
                 clockwise:YES];
     */
    
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
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
}




@end
