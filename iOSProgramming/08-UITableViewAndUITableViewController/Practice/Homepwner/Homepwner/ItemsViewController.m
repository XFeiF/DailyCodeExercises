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

@property NSMutableArray *over50;
@property NSMutableArray *below50;

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

// 设置section的数目
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

// 设置各个section的Head title
-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"More than 50";
    }else if(section == 1){
        return @"No more than 50";
    }else{
        return nil;
    }
}

// 重写该方法时，针对不同section返回其各自的行数
// 同时在该方法中，根据条件 >50 划分数据集到两个子数据集中
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    
    NSArray *all = [[MItemStroe sharedStore] allItems];
    _over50 = [[NSMutableArray alloc]init];
    _below50 = [[NSMutableArray alloc] init];
    for(MItem *item in all){
        if ([item _valueInDollars] > 50) {
            [_over50 addObject:item];
        }else{
            [_below50 addObject:item];
        }
    }
    
    if (section == 0) {
        return [_over50 count];
    }else {
        //这里返回的数目+1，多一个cell来存放no more items
        return [_below50 count]+1;
    }
    
}

// 根据section设置内容
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpeg"]];
    [tableView setBackgroundView:tableBg];
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                            forIndexPath:indexPath];
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    
    //cell.backgroundView = tableBg;
    cell.backgroundColor = [UIColor clearColor];
    tableView.rowHeight = 60;
    if (section == 0) {
        MItem *item = _over50[row];
        cell.textLabel.text = [item description];
        
    }
    
    if (section == 1 && row < [_below50 count]) {
        MItem *item = _below50[row];
        cell.textLabel.text = [item description];
    }else if(section == 1 && row == [_below50 count]){
        //  在此设置no more items
        //
        cell.textLabel.text=@"No more items";
        tableView.rowHeight = 44;
    }
    return cell;
}



-(void)viewDidLoad{
    [super viewDidLoad];
    // 注册类
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}




@end
