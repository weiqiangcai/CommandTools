//
//  CHOIDPopMenuView.m
//  FamilyPlatForm
//
//  Created by cai on 17/11/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CHOIDPopMenuView.h"
#import "CHOIPopMenuItem.h"
#import "CHOIPopMenuCell.h"
#import "CHOIDPopMenuViewSingleton.h"

#define CELLHEIGHT 40

@interface CHOIDPopMenuView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) CGFloat menuWidth;
@property (nonatomic,copy) NSArray *menuItems;
@property (nonatomic,assign) CGPoint startPoint;
@property (nonatomic,copy) void (^action)(NSInteger index,CHOIPopMenuItem *model);
@property(nonatomic,strong)UIImageView *bgImageView;


@end

@implementation CHOIDPopMenuView


-(instancetype)initWithFrame:(CGRect)frame menuStartPoint:(CGPoint)startPoint menuWidth:(CGFloat)menuWidth menuItems:(NSArray *)items offSet:(CGFloat)offSet action:(void (^)(NSInteger, CHOIPopMenuItem *))action{
    
    if (self = [super initWithFrame:frame]) {
        
        self.menuWidth = menuWidth;
        self.menuItems = items;
        self.startPoint = startPoint;
        
        CGFloat menuViewX = self.startPoint.x;
        CGFloat menuViewY = self.startPoint.y;
        CGFloat menuWidth = self.menuWidth;
        CGFloat menuHeight = self.menuItems.count * CELLHEIGHT;
        CGFloat offset = offSet;
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.frame = CGRectMake(menuViewX, menuViewY-offset, menuWidth, menuHeight +offset);
        [self addSubview:_bgImageView];
        
        
        
        self.action = [action copy];
        self.popMenuTableView = [[UITableView alloc] initWithFrame:CGRectMake(menuViewX, menuViewY, menuWidth, menuHeight) style:UITableViewStylePlain];
        self.popMenuTableView.delegate = self;
        self.popMenuTableView.dataSource = self;
        //        self.popMenuTableView.layer.cornerRadius = 10;
        //        self.popMenuTableView.layer.anchorPoint = CGPointMake(1.0, 0);
        self.popMenuTableView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.popMenuTableView.rowHeight = CELLHEIGHT;
        self.popMenuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.popMenuTableView];
    
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refresh) name:ChoiRefreshPopMneuNotification object:nil];
       
    }
    return self;
    
}

-(void)refresh{
    
    NSNumber *oldIndexPath = [[NSUserDefaults standardUserDefaults]objectForKey:@"indexPath"];
    
    if (oldIndexPath) {
        
        NSIndexPath *oldIndex = [NSIndexPath indexPathForRow:[oldIndexPath integerValue] inSection:0];
        
        CHOIPopMenuCell *cell = [self.popMenuTableView cellForRowAtIndexPath:oldIndex];
        
        cell.isSelected = YES;
        
        cell.titleSelectedColr = _titleSelectedColr;
        
        [self.popMenuTableView reloadData];
        
    }
}
-(void)setTabBgImage:(UIImage *)tabBgImage{
    
    _tabBgImage = tabBgImage;

    [tabBgImage stretchableImageWithLeftCapWidth:tabBgImage.size.width *0.5 topCapHeight:tabBgImage.size.height*0.5];
    _bgImageView.image = tabBgImage;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CHOIPopMenuCell *cell = [CHOIPopMenuCell cellWithTableView:tableView];
    cell.contentView.backgroundColor = _tabCellBgColor;
    cell.titleNormalColor = _titleNormalColor;
    cell.selectedImage = _selectedImage;
    if (self.menuItems > 0)
    {
        CHOIPopMenuItem *model = self.menuItems[indexPath.row];
        cell.Menu = model;
    }
    

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [[NSUserDefaults standardUserDefaults]setObject:@(indexPath.row) forKey:@"indexPath"];
    
    CHOIPopMenuItem *model = self.menuItems[indexPath.row];
    
    if (self.action)
    {
        self.action(indexPath.row,model);
    }
}
//- (CGRect)popMenuViewFrame
//{
//    CGFloat menuViewX = self.startPoint.x;
//    CGFloat menuViewY = self.startPoint.y;
//    CGFloat menuWidth = self.menuWidth;
//    CGFloat menuHeight = self.menuItems.count * CELLHEIGHT;
//    
//    return CGRectMake(menuViewX, menuViewY, menuWidth, menuHeight);
//    
//}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[CHOIDPopMenuViewSingleton shareManager] menuHide];
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



@end
