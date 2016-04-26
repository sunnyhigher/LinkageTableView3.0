//
//  ZSLinkageView.h
//  LinkageTableView
//
//  Created by 周顺 on 16/4/8.
//  Copyright © 2016年 Lianbi.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSLinkageView : UIView

- (instancetype)initWithFrame:(CGRect)frame leftTableViewWidth:(CGFloat)leftTableViewWidth dataArray:(NSArray *)dataArray;

/**
 *  选中右侧tableView某一行
 */
@property (nonatomic, copy) void (^clickRightTableHandler)(NSIndexPath *indexPath);

@end
