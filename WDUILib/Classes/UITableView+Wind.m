//
//  UITableView+Wind.m
//  Hola
//
//  Created by Wind on 2022/12/3.
//

#import "UITableView+Wind.h"
#import <objc/runtime.h>

//static BOOL hasReload;

@implementation UITableView (Wind)

- (void)awakeFromNib {
    [super awakeFromNib];
    self.estimatedRowHeight = 0;
    self.estimatedSectionHeaderHeight = 0;
    self.estimatedSectionFooterHeight = 0;
}

- (void)reloadDataOrEmpty:(Action)action {
    WindEmptyView *emptyView;
    BOOL isEmpty = NO;

    if ([self.dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        for (int i = 0; i < self.numberOfSections; i ++) {
            if (![self.dataSource tableView:self numberOfRowsInSection:i]) {
                isEmpty = YES;
                break;
            }
        }
    }

    
    if (isEmpty) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[WindEmptyView class]]) {
                emptyView = (WindEmptyView*)view;
                break;
            }
        }
        if (emptyView == nil) {
            emptyView = [[WindEmptyView alloc] init];
            [self addSubview:emptyView];
        }
        [emptyView setHidden:NO];
        CGRect headerFrame = self.tableHeaderView.frame;
        emptyView.frame = CGRectMake(0,
                                     headerFrame.size.height,
                                     self.bounds.size.width,
                                     self.bounds.size.height - headerFrame.size.height);
        //[emptyView configImage:@"Empty_View.png" title:@"现在没有内容" btnTitle:@"reload" action:nil];
//        [emptyView configImage:@"Common_Empty.png" title:@"现在没有内容" btnTitle:@"重新加载" action:^{
//            if (action) {
//                action();
//            }
//        }];
        [emptyView configImage:@"Common_Empty.png" action:^{
            if (action) {
                action();
            }
        }];
    } else {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[WindEmptyView class]]) {
                emptyView =  (WindEmptyView*)view;
                [emptyView setHidden:YES];
            }
        }
    }
    [self reloadData];
}

@end
