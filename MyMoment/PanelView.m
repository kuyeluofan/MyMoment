//
//  PanelView.m
//  MyMoment
//
//  Created by 叶帆 on 9/7/15.
//  Copyright (c) 2015 kuyeluofan. All rights reserved.
//

#import "PanelView.h"
#import <Masonry.h>

@implementation PanelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.timerLabel];
        [self addSubview:self.switchButton];
        
        [self.timerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(30);
        }];
        
        [self.switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-120);
            make.height.width.equalTo(@102);
        }];
        
    }
    return self;
    
}

- (UILabel *)timerLabel{
    
    if (!_timerLabel) {
        _timerLabel = [UILabel new];
        _timerLabel.backgroundColor = [UIColor clearColor];
        _timerLabel.textColor = [UIColor whiteColor];
        _timerLabel.font = [UIFont systemFontOfSize:91 weight:UIFontWeightUltraLight];
    }
    return _timerLabel;
    
}

- (UIButton *)switchButton{
    
    if (!_switchButton) {
        _switchButton = [UIButton new];
        _switchButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
        _switchButton.tintColor = [UIColor whiteColor];
        _switchButton.titleLabel.text = @"Start";
        _switchButton.layer.cornerRadius = 51;
        _switchButton.layer.borderWidth = 2.5;
        _switchButton.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _switchButton;
    
}

@end
