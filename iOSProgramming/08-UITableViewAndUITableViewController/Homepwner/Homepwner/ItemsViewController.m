//
//  ItemsViewController.m
//  Homepwner
//
//  Created by XFeiF on 2016/11/21.
//  Copyright © 2016年 NodeX. All rights reserved.
//

#import "ItemsViewController.h"
#import "MItem.h"
#import "MItemStroe.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController

-(instancetype)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 20; i++) {
            [[MItemStroe sharedStore] createItem];
        }
    }
    
    return self;
}


-(instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    return self.init;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return [[[MItemStroe sharedStore] allItems] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:@"UITableViewCell"];
    */
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    NSArray *items = [[MItemStroe sharedStore] allItems];
    MItem *item = [items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [item description];
    return cell;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}


@end
