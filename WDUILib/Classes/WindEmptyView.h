//
//  WindEmptyView.h
//  Hola
//
//  Created by Wind on 2022/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Action)(void);

@interface WindEmptyView : UIView

- (void)configImage:(NSString *)image action:(Action)action;

- (void)configImage:(NSString *)image title:(NSString *)title btnTitle:(NSString *)btnTitle action:(Action)action;

@end

NS_ASSUME_NONNULL_END
