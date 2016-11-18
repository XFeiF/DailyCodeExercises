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
    
    // 4.6 4.8
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

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
    
    
    
    /*
    // 这里练习使用Core Graphics
    CGContextSetRGBStrokeColor(currentContext, 1, 0, 0, 1);
    CGMutablePathRef apath = CGPathCreateMutable();
    CGPoint a = CGPointMake(100, 100);
    CGPoint b = CGPointMake(100, 200);
    CGPathMoveToPoint(apath, NULL, a.x, a.y);
    CGPathAddLineToPoint(apath, NULL, b.x, b.y);
    CGContextAddPath(currentContext, apath);
    CGContextStrokePath(currentContext);
    CGPathRelease(apath);
    */
    
    // 4.8 渐变
    /* 练习
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0, // 起始颜色为红色
                             1.0, 1.0, 0.0, 1.0};//终止颜色设为黄色
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    CGPoint startPoint = CGPointMake(center.x - 150, center.y -150);
    CGPoint endPoint = CGPointMake(center.x + 150, center.y + 150);
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    */
    
    CGContextSaveGState(currentContext);
    
    UIBezierPath *mypath = [[UIBezierPath alloc]init];
    CGPoint top = CGPointMake(center.x, center.y -150);
    CGPoint bottoml = CGPointMake(center.x - 150, center.y + 150);
    CGPoint bottomr = CGPointMake(center.x + 150, center.y + 150);
    [mypath moveToPoint:top];
    [mypath addLineToPoint:bottoml];
    [mypath addLineToPoint:bottomr];
    //CGContextAddPath(currentContext, mypath);
    [mypath addClip];
    
    CGFloat components[8] = {1.0, 1.0, 0.0, 1.0,// yellow
                             0.0, 1.0, 0.0, 1.0}; //green
    CGFloat locations[2] = {0.0, 1.0};
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGPoint startPoint = CGPointMake(top.x, top.y);
    CGPoint endPoint = CGPointMake(center.x, center.y + 150);

    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGContextDrawLinearGradient(currentContext, gradient, endPoint, startPoint, 0);
    
    CGContextRestoreGState(currentContext);
    
    // 4.8 高级练习：阴影和渐变
    // 阴影
    
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    // 4.6 初级练习：绘制图像
    // 添加logo图片
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    // 添加一个矩形，长宽为图像长宽，均为300，位于父视图的中央
    CGRect logoRect = CGRectMake(center.x - 150, center.y - 150, 300, 300);
    [logoImage drawInRect: logoRect];
    
    
    
    CGContextRestoreGState(currentContext);
    
}




@end
