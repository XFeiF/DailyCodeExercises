//
//  MItem.h
//  RandomItems
//
//  Created by XFeiF on 2016/11/15.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;



// 第三章新增代码
@property (nonatomic, strong) MItem *containedItem;

//@property MItem *container;
@property (nonatomic, weak) MItem *container;


+(instancetype)randomItem;
// MItem 类的指定初始化方法
-(instancetype)initWithItemName:(NSString *)name
                 valueInDollors:(int)value
                   serialNumber:(NSString *)sNumber;

-(instancetype)initWithItemName:(NSString *)name;

// 2.9中级练习：另一个初始化方法
-(instancetype)initWithItemName:(NSString *)name
                   serialNumber:(NSString *)sNumber;


@end
