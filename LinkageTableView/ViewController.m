//
//  ViewController.m
//  LinkageTableView
//
//  Created by 周顺 on 16/4/7.
//  Copyright © 2016年 Lianbi.com.cn. All rights reserved.
//

#import "ViewController.h"
#import "ZSLinkageView.h"

#define kLeftTableViewWidth 120

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZSLinkageView *linkageView = [[ZSLinkageView alloc] initWithFrame:self.view.bounds leftTableViewWidth:120 dataArray:self.dataArray];
    
    /**
     *  响应右侧cell点击事件
     */
    linkageView.clickRightTableHandler = ^(NSIndexPath *indexPath) {
        NSLog(@"点击右侧cell--Section:%ld--Row:%ld", indexPath.section, indexPath.row);
    };
    
    [self.view addSubview:linkageView];

}

- (NSArray *)dataArray {
    NSArray *array = @[
                       @{@"sectionName":@"section0",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section1",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section2",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section3",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section4",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section5",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section6",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section7",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section8",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section9",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section10",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section11",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section12",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section13",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section14",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section15",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         },
                       @{@"sectionName":@"section16",
                         @"rowName":@[@"row0",@"row1",@"row2",@"row3",@"row4",@"row5",@"row6",@"row7",@"row8",@"row9"]
                         }
                       
                       ];
    return array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
