//
//  ZSLinkageView.m
//  LinkageTableView
//
//  Created by 周顺 on 16/4/8.
//  Copyright © 2016年 Lianbi.com.cn. All rights reserved.
//

#import "ZSLinkageView.h"

#define kLeftTableViewRowHeight  60
#define kRightTableViewRowHeight 90


@interface ZSLinkageView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) BOOL isRelate;
//@property (nonatomic, assign) BOOL leftScroll; //左侧人工滚动
//@property (nonatomic, assign) BOOL rightScroll; //右侧人工滚动
//@property (nonatomic, assign) BOOL isScroll;//是否系统滚动

@property (nonatomic) id currentTableView;

@end


@implementation ZSLinkageView

- (instancetype)initWithFrame:(CGRect)frame leftTableViewWidth:(CGFloat)leftTableViewWidth dataArray:(NSArray *)dataArray {
    self = [super initWithFrame:frame];
    if (self ) {
        
        _dataArray = dataArray;
        
        CGRect leftFrame = CGRectMake(0, 0, leftTableViewWidth, frame.size.height);
        CGRect rightFrame = CGRectMake(leftTableViewWidth, 0, frame.size.width - leftTableViewWidth, frame.size.height);
        
        _leftTableView = [[UITableView alloc] initWithFrame:leftFrame style:UITableViewStylePlain];
        _rightTableView = [[UITableView alloc] initWithFrame:rightFrame style:UITableViewStylePlain];
        _leftTableView.delegate = _rightTableView.delegate = self;
        _leftTableView.dataSource = _rightTableView.dataSource = self;
        _leftTableView.showsVerticalScrollIndicator = NO;
        
        [self addSubview:_leftTableView];
        [self addSubview:_rightTableView];
        
        _isRelate = YES;
    }
    return self;
}


#pragma mark -

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return tableView == _leftTableView ? 1 : self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _leftTableView) {
        return self.dataArray.count;
    } else {
        NSDictionary *dict = [self.dataArray objectAtIndex:section];
        return [[dict objectForKey:@"rowName"] count];
    }
}

#pragma mark - 在此处配置cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"leftID";
    static NSString *cellID2 = @"rightID";
    
    if (tableView == _leftTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        cell.textLabel.text = [self.dataArray[indexPath.row] objectForKey:@"sectionName"];
        
        /**
         *  此处是配置选中背景
         */
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
        selectedBackgroundView.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:0.5];
        cell.selectedBackgroundView = selectedBackgroundView;
        
        CGFloat width = 5;
        CGFloat height = kLeftTableViewRowHeight;
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        lineView.backgroundColor = [UIColor redColor];
        [selectedBackgroundView addSubview:lineView];
        
        return cell;
        
    } else {
        
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID2];
        if (cell==nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID2];
        }
        
        NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.section];
        cell.textLabel.text = dict[@"rowName"][indexPath.row];
        return cell;
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == _rightTableView) {
        NSDictionary *item = [_dataArray objectAtIndex:section];
        NSString *title = [item objectForKey:@"sectionName"];
        return title;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return tableView == _leftTableView ? kLeftTableViewRowHeight : kRightTableViewRowHeight;
}

#pragma mark -


- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (_isRelate ) {
        
        NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
        if (tableView == self.rightTableView) {
            if ([self.currentTableView isEqual:self.leftTableView]) {
                
            } else {
                [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            }
        }
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section {
    
    if (_isRelate ) {
        
        NSInteger topCellSection = [[[tableView indexPathsForVisibleRows] firstObject] section];
        if (tableView == self.rightTableView) {
            if ([self.currentTableView isEqual:self.leftTableView]) {
                
            } else {
                [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topCellSection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            }
        }
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return tableView == _rightTableView ? 0.01 : 0;
}

#pragma mark - didSelectRowAtIndexPath(选中某一行)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        self.currentTableView = self.leftTableView;
        [self.leftTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }else {
        if (self.clickRightTableHandler) {
            self.clickRightTableHandler(indexPath);
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _isRelate = YES;
    self.currentTableView = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (self.currentTableView == nil) {
        self.currentTableView = (UITableView *)scrollView;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.leftTableView) {
        if ([self.currentTableView isEqual:self.leftTableView]) {
            CGFloat offestY = scrollView.contentOffset.y + scrollView.contentInset.top;
            if (offestY < 0)  return;//滑动到最上方时停止
            CGFloat offsetMaxY = self.dataArray.count * kLeftTableViewRowHeight - self.leftTableView.frame.size.height;
            if (offestY > offsetMaxY) return; //滑动到不能滑动时停止
            NSInteger row = offestY / kLeftTableViewRowHeight;
            NSLog(@"%ld", row);
            
            [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
            
            [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    }
    
}
@end
