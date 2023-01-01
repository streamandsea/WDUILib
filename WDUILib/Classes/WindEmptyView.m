//
//  WindEmptyView.m
//  Hola
//
//  Created by Wind on 2022/12/2.
//

#import "WindEmptyView.h"



@interface WindEmptyView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIButton *reloadBtn;

@property (nonatomic, copy)Action action;

@end

@implementation WindEmptyView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle bundleForClass:[WindEmptyView class]] loadNibNamed:@"WindEmptyView" owner:self options:nil] lastObject];
    }
    return self;
}

- (IBAction)reloadAct:(UIButton *)sender {
    if (self.action) {
        self.action();
    }
}

- (void)configImage:(NSString *)image action:(Action)action{
    self.iconImgView.image = [UIImage imageNamed:image];
    self.action = action;
}

- (void)configImage:(NSString *)image title:(NSString *)title btnTitle:(NSString *)btnTitle action:(Action)action {
    self.iconImgView.image = [UIImage imageNamed:image];
    self.titleLbl.text = title;
    [self.reloadBtn setTitle:btnTitle forState:UIControlStateNormal];
    self.action = action;
}

@end
