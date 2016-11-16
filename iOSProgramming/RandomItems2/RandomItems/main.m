//
//  main.m
//  RandomItems
//
//  Created by XFeiF on 2016/11/15.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        MItem *backpack = [[MItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        MItem *calculator = [[MItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        calculator.container = backpack;
        backpack = nil;
        calculator = nil;
        
        for (MItem *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil......");
        items = nil;
        
    }
    return 0;
}
