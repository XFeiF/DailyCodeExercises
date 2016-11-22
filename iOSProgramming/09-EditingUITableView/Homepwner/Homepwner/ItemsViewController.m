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

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation ItemsViewController


-(instancetype)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 10; i++) {
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
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}


// chapter9
-(UIView *)headerView{
    // 如果还没有载入headerView
    if (!_headerView) {
        // 载入
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    
    return _headerView;
}


-(IBAction)addNewItem:(id)sender{
    
    MItem *item = [[MItemStroe sharedStore] createItem];
    
    // 创建NSIndexPath对象，代表的位置是：第一个表格段，最后一个表格行
    NSInteger lastRow = [[[MItemStroe sharedStore]allItems]indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // 将新行插入UITableView对象
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
    
    
}

-(IBAction)toggleEditingMode:(id)sender{
    // 如果当前的视图控制对象已经处于编辑状态
    if (self.isEditing) {
        // 修改按钮文字，提示用户当前的表格状态
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        
        // 关闭编辑模式
        [self setEditing:NO animated:YES];
    } else{
        
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
        [self setEditing:YES animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[MItemStroe sharedStore] allItems];
        MItem *item = items[indexPath.row];
        [[MItemStroe sharedStore] removeItem:item];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[MItemStroe sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}









@end
