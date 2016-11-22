//
//  MItemStroe.m
//  Homepwner
//
//  Created by XFeiF on 2016/11/21.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "MItemStroe.h"
#import "MItem.h"

@interface MItemStroe()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation MItemStroe

+(instancetype)sharedStore{
    static MItemStroe *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

-(instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[MItemStore sharedStore]"
                                 userInfo:nil];
}

-(instancetype)initPrivate{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSArray *)allItems{
    return [_privateItems copy];
}

-(MItem *)createItem{
    MItem *randomItem = [MItem randomItem];
    [_privateItems addObject:randomItem];
    
    return randomItem;
}

-(void)removeItem:(MItem *)item{
    [self.privateItems removeObjectIdenticalTo:item];
}

-(void)moveItemAtIndex:(NSUInteger)fromIndex
               toIndex:(NSUInteger)toIndex{
    if (fromIndex == toIndex) {
        return;
    }
    MItem *item = self.privateItems[fromIndex];
    
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    [self.privateItems insertObject:item atIndex:toIndex];
}

@end
