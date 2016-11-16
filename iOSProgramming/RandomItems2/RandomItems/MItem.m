//
//  MItem.m
//  RandomItems
//
//  Created by XFeiF on 2016/11/15.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "MItem.h"

@implementation MItem



- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}


-(NSString *)description{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated
                                   ];
    return descriptionString;
}

-(instancetype)initWithItemName:(NSString *)name
                 valueInDollors:(int)value
                   serialNumber:(NSString *)sNumber{
    self = [super init];
    
    if (self) {
        // 为实例变量设定初始值
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc]init];
    }
    
    return self;
}

-(instancetype)initWithItemName:(NSString *)name{
    return [self initWithItemName:name
                   valueInDollors:0
                     serialNumber:@""];
}

-(instancetype)initWithItemName:(NSString *)name
                   serialNumber:(NSString *)sNumber{
    return [self initWithItemName:name
                   valueInDollors:0
                     serialNumber:sNumber];
}

-(instancetype)init{
    return [self initWithItemName:@"Item"];
}

+(instancetype)randomItem{
    // 创建不可变数组对象，包含三个形容词
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // 创建不可变数组对象，包含三个名词
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // 根据数组对象所含对象的个数，得到随机索引
    // 注意：运算符%是模运算
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // 注意：类型为NSInteger的变量不是对象
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    MItem *newItem = [[self alloc] initWithItemName:randomName
                                     valueInDollors:randomValue
                                       serialNumber:randomSerialNumber];
    return newItem;
}

@end
