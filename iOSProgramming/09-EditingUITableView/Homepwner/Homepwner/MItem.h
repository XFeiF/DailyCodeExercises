//
//  MItem.h
//  RandomItems
//
//  Created by XFeiF on 2016/11/15.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MItem : NSObject

@property NSString *_itemName;
@property NSString *_serialNumber;
@property int _valueInDollars;
@property (readonly)NSDate *_dateCreated;

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
