//
//  UITableView+Wind.h
//  Hola
//
//  Created by Wind on 2022/12/3.
//

#import <UIKit/UIKit.h>
#import "WindEmptyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Wind)

- (void)reloadDataOrEmpty:(Action)action;

@end

NS_ASSUME_NONNULL_END
