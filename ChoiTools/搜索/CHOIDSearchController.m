//
//  CHOIDSearchController.m
//  FamilyPlatForm
//
//  Created by cai on 17/11/22.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CHOIDSearchController.h"
#import "CHOIDSearchDataBase.h"
#import "CHOIDSearchHistoryCell.h"
@interface CHOIDSearchController ()

@end

@implementation CHOIDSearchController

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.historyArray = [NSMutableArray array];
        //从本地读取缓存的历史记录
        self.historyArray = [[CHOIDSearchDataBase shareDataBase]readLocalArray];
        self.delegate   = self;
        self.dataSource = self;
        
        
        //隐藏tableview多余的线
        [self setExtraCellLineHidden:self];
    }
    return self;
}


//去掉tableView多余的分割线
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

//添加一条历史记录
- (void)addHistoryWithString:(NSString *)string{
    
    //先改变tableview的数据源
    if ([self.historyArray containsObject:string]) {
        [self.historyArray removeObject:string];
        [self reloadData];
    }
    [self.historyArray insertObject:string atIndex:0];
    //在进行界面插入单元格操作
    [self insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
    [self reloadData];
    
    //存储新的数据源到本地，以保证下次打开程序有之前搜索的记录
    [[CHOIDSearchDataBase shareDataBase]writeLocalWithDataArray:self.historyArray];
    
}


//删除一条
- (void)deleteHistoryWithIndex:(NSInteger )index{
    
    if (index >=0&& index<self.historyArray.count) {
        
        [self.historyArray removeObjectAtIndex:index];
        [self deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
        [[CHOIDSearchDataBase shareDataBase]writeLocalWithDataArray:self.historyArray];
        [self reloadData];
    }
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.historyArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CHOIDSearchHistoryCell *cell = [self dequeueReusableCellWithIdentifier:@"identifier_history"];
    if (cell == nil) {
        cell = [[CHOIDSearchHistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier_history"];
        [cell.mb_deleteButton addTarget:self action:@selector(handleDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    cell.mb_deleteButton.tag = indexPath.row;
    
    if (indexPath.row>=0&&indexPath.row<self.historyArray.count) {
        cell.mb_label.text = self.historyArray[indexPath.row];
    }
    
    return cell;
    
    
}

//设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}


//点击搜索历史记录并回调出去
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        CHOIDSearchHistoryCell *cell = (CHOIDSearchHistoryCell*)[self cellForRowAtIndexPath:indexPath];
        if (self.selectHistoryCell) {
            self.selectHistoryCell(cell.mb_label.text);
        }
    }
    
}

//设置分区header的title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"历史记录";
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
    [footer.textLabel setTextColor:UIColorFromRGB(0x999999)];
    footer.textLabel.font = [UIFont  systemFontOfSize:14];
    view.tintColor = UIColorFromRGB(0xf2f2f2);
}
//点击删除按钮，删除历史记录
- (void)handleDeleteButton:(UIButton *)button{
    [self deleteHistoryWithIndex:button.tag];
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.beginDraggingBlock) {
        //回调tableview滑动的回调
        self.beginDraggingBlock();
    }
}
-(void)dealloc{
    
}

@end
