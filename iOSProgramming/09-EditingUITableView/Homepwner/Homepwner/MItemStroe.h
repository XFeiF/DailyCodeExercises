//
//  MItemStroe.h
//  Homepwner
//
//  Created by XFeiF on 2016/11/21.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MItem;

@interface MItemStroe : NSObject

@property (nonatomic, readonly)NSArray *allItems;

+(instancetype)sharedStore;
-(MItem *)createItem;
-(void)removeItem:(MItem *)item;

-(void)moveItemAtIndex:(NSUInteger)fromIndex
               toIndex:(NSUInteger)toIndex;
@end
