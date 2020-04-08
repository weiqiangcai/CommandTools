//
//  CHOIDSearchController.h
//  FamilyPlatForm
//
//  Created by cai on 17/11/22.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

//点击历史记录cell，回调该条历史记录
typedef void(^SelectHistoryCell)(NSString *string);
//回调滑动tableview的时机，用于弹回键盘并看到更多内容
typedef void(^BeginDraggingBlock)();

@interface CHOIDSearchController : UITableView<UITableViewDataSource,UITableViewDelegate>
//数据源
@property(nonatomic,strong)NSMutableArray   *historyArray;

@property(nonatomic,copy)SelectHistoryCell  selectHistoryCell;

@property(nonatomic,copy)BeginDraggingBlock  beginDraggingBlock;

//添加一条历史记录
- (void)addHistoryWithString:(NSString *)string;

@end
