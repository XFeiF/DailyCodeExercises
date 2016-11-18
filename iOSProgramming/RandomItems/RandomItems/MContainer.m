//
//  MContainer.m
//  RandomItems
//
//  Created by XFeiF on 2016/11/15.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "MContainer.h"

@implementation MContainer


@synthesize subitems;

-(NSString *)description{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ with value: %d", self._itemName,[self sumValue]];
    for(id item in subitems){
        NSLog(@"%@", item);
    }
    return descriptionString;
}

-(int) sumValue{
    int sum = 0;
    if (self) {
        sum = self._valueInDollars;
        if ([subitems count] > 0) {
            for (MContainer *item in subitems) {
                sum += [item sumValue];
            }
        }
        self._valueInDollars = sum;
    }
    
    return sum;
}

@end
