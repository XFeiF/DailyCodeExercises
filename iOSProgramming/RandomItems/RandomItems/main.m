//
//  main.m
//  RandomItems
//
//  Created by XFeiF on 2016/11/15.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MItem.h"
#import "MContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个NSMutableArray对象，并用items变量保存该对象的地址
        id items = [[NSMutableArray alloc] init];
        
        // 向items所指向的NSMutableArray对象发送addObject：消息
        // 每次传入一个字符串
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        // 继续向同一个对象发送消息，这次是insertObject:atIndex:
        [items insertObject:@"Zero" atIndex:0];
        
        // 遍历items数组中的每一个item
        for (NSString *item in items){
            NSLog(@"%@", item);
        }
        
        MItem *item = [[MItem alloc] init];
        
        //[item set_itemName:@"Red Sofa"];
        //[item set_serialNumber:@"A1B2C"];
        //[item set_valueInDollars:100];
        
        //NSLog(@"%@ %@ %@ %d",
        //      [item _itemName],
        //      [item _dateCreated],
        //      [item _serialNumber],
        //      [item _valueInDollars]);
        
        item._itemName = @"Red Sofa";
        item._serialNumber = @"A1B2C";
        item._valueInDollars = 100;
        
        //NSLog(@"%@ %@ %@ %d",
        //      item._itemName,
        //      item._dateCreated,
        //      item._serialNumber,
        //      item._valueInDollars);
        NSLog(@"%@",item);
        
        
        //  四个初始化方法测试
        MItem *item2 = [[MItem alloc]init];
        NSLog(@"%@",item2);
        
        id item3 = [[MItem alloc] initWithItemName:@"Apple"];
        NSLog(@"%@",item3);
        
        id item4 = [[MItem alloc] initWithItemName:@"PineApple" valueInDollors:10 serialNumber:@"AAA"];
        NSLog(@"%@",item4);
        
        id item5 = [[MItem alloc] initWithItemName:@"PPAP" serialNumber:@"pPAp"];
        NSLog(@"%@", item5);
        
        // 释放items所指向的NSMutableArray对象
        items = nil;item = nil;item2 = nil; item3 = nil; item4 =nil;item5 = nil;
        
        NSMutableArray *mItems = [[NSMutableArray alloc] init];
        for (int i =0; i < 10; i++) {
            id mItem = [MItem randomItem];
            mItems[i] = mItem;
        }
        
        for (id item in mItems){
            NSLog(@"%@", item);
        }
        
        /*
        
        id lastObj = [mItems lastObject];
        [lastObj count];
         *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[MItem count]: unrecognized selector sent to instance 0x100403cc0'
         
         */
        
        /*
         // 2.8 初级练习：查找问题。  数组越界
         NSLog(@"%@", mItems[10]);
         *** Terminating app due to uncaught exception 'NSRangeException', reason: '*** -[__NSArrayM objectAtIndex:]: index 10 beyond bounds [0 .. 9]'
         */
        
        
        mItems = nil;
        
        
        
        NSLog(@"***************************");
        /*
         
         2.10 高级练习：另一个类
         先导入 MContainer.h
         */
        // 创建MContainer对象，并初始化，这里使用父类的randomItem方法
        MContainer *container = [MContainer randomItem];
        // 为subitems 初始化？
        container.subitems = [[NSMutableArray alloc] init];
        // 向subitems加入5个随机的MItem对象
        for (int i = 0; i < 5; i++){
            MContainer *item = [MContainer randomItem];
           // NSLog(@"%@", item);
            container.subitems[i] = item;
        }
        
        
        NSLog(@"Finally: %@", container);
        
        
    }
    return 0;
}
