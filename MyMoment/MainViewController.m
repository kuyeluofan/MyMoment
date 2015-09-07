//
//  MainViewController.m
//  MyMoment
//
//  Created by 叶帆 on 8/26/15.
//  Copyright (c) 2015 kuyeluofan. All rights reserved.
//

#import "MainViewController.h"
#import <Masonry.h>
#import "FXBlurView.h"


@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *switchButton;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic)  NSTimer *timer;
@property (strong, nonatomic) FXBlurView *floatView;

@property (nonatomic) NSUInteger countTimeSecondNumber;
@property (nonatomic) NSUInteger tomatoTimeSecondNumber;
@property (nonatomic) NSUInteger restTimeSecondNumber;
@property (nonatomic) NSUInteger myMomentState;

@end

@implementation MainViewController

typedef NS_ENUM(NSUInteger, MyMomentState) {
    MyMomentStateNone = 0,
    MyMomentStateRest = 1,
    MyMomentStateBusy = 2,
};

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:1];
    self.switchButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.tomatoTimeSecondNumber = 10;
    self.restTimeSecondNumber = 5;
    self.countTimeSecondNumber = self.tomatoTimeSecondNumber;
    
//    [self initFloatView];
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.8 animations:^{
        self.view.backgroundColor = [UIColor colorWithRed:240.0/255 green:83.0/255 blue:82.0/255 alpha:1];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickSwitchButton:(id)sender {

    if ([self.switchButton.currentTitle isEqualToString:@"Start"]) {
        [self switchMymonetStateTo:MyMomentStateBusy];
    } else if([self.switchButton.currentTitle isEqualToString:@"Cancel"]) {
        [self switchMymonetStateTo:MyMomentStateNone];
    } else if([self.switchButton.currentTitle isEqualToString:@"Stop"]){
        [self switchMymonetStateTo:MyMomentStateNone];
    }
    
    //TODO:使用switch方法切换
//    if ([self.switchButton.currentTitle isEqualToString:@"Start"]) {
//        //点击开始倒计时
//        [self startTimer];
//    } else {
//        //点击取消计时
//        [self stopTimer];
//    }
    
}

//- (void)initFloatView {
//    
//    self.floatView = [FXBlurView new];
//    self.floatView.tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
//    self.floatView.backgroundColor = [UIColor whiteColor];
//    self.floatView.blurRadius = 0;
//    self.floatView.dynamic = NO;

//    UITapGestureRecognizer *floatTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFloatView)];
//    floatTapRecognizer.numberOfTapsRequired = 1;
//    [self.floatView addGestureRecognizer:floatTapRecognizer];
    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)countDown{
    if (self.countTimeSecondNumber == 0) {
        if (self.myMomentState == MyMomentStateBusy) {
            [self switchMymonetStateTo:MyMomentStateRest];
        } else if (self.myMomentState == MyMomentStateRest){
            [self switchMymonetStateTo:MyMomentStateNone];
        }
        return;
    }
    self.countTimeSecondNumber -= 1;
}

- (NSString *)countDownStringFromSeconds:(NSInteger)originSeconds{
    NSInteger minutes = 0;
    NSInteger seconds = 0;
    if (originSeconds > 0) {
        minutes = originSeconds / 60;
        seconds = originSeconds % 60;
    }
    
    NSString *minutesAndSecondsString = [NSString stringWithFormat:@"%ld:%02ld", (long)minutes, (long)seconds];
    return minutesAndSecondsString;
}

- (void)switchMymonetStateTo:(MyMomentState) myMomentState{
    self.myMomentState = myMomentState;
    
    if (myMomentState == MyMomentStateNone) {
        
        [UIView animateWithDuration:0.8 animations:^{
            self.view.backgroundColor = [UIColor colorWithHue:0/255.0 saturation:167/255.0 brightness:240/255.0 alpha:1];
        }];
        [self.switchButton setTitle:@"Start" forState:UIControlStateNormal];
        self.countTimeSecondNumber = self.tomatoTimeSecondNumber;
        [self.timer invalidate];

    } else if (myMomentState == MyMomentStateRest){
        
        [UIView animateWithDuration:0.8 animations:^{
            self.view.backgroundColor =[UIColor colorWithHue:117/255.0 saturation:173/255.0 brightness:195/255.0 alpha:1];
        }];
        [self.switchButton setTitle:@"Stop" forState:UIControlStateNormal];
        self.countTimeSecondNumber = self.restTimeSecondNumber;
        [self.timer invalidate];
        [self startTimer];
        
        
    } else if (myMomentState == MyMomentStateBusy){
        
        [UIView animateWithDuration:0.8 animations:^{
            self.view.backgroundColor = [UIColor colorWithRed:240.0/255 green:83.0/255 blue:82.0/255 alpha:1];
        }];
        [self.switchButton setTitle:@"Cancel" forState:UIControlStateNormal];
        self.countTimeSecondNumber = self.tomatoTimeSecondNumber;
        [self.timer invalidate];
        [self startTimer];
        
    }
}





- (void)startTimer{
    self.timer = nil;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

#pragma mark - getter and setter


- (void)setCountTimeSecondNumber:(NSUInteger)countTimeSecondNumber{
    
    if (_countTimeSecondNumber != countTimeSecondNumber) {
        _countTimeSecondNumber = countTimeSecondNumber;
        self.timerLabel.text = [self countDownStringFromSeconds:_countTimeSecondNumber];
    }
    
}

//- (IBAction)tapRootView:(id)sender {
//    
//    
//    [self.view addSubview:self.floatView];
//    [self.floatView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//    [UIView animateWithDuration:0.5 animations:^{
//        self.floatView.blurRadius = 40;
//    }];
//    
//}

//- (void)tapFloatView{
//    [self.floatView removeFromSuperview];
//}


//- (UIView *)timeRecordView{
//    
//    //TODO:滑动应该用UIScrollView实现
//    
//    if (!_timeRecordView) {
//        _timeRecordView = [UIView new];
//        _timeRecordView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//        [self.floatView addSubview:_timeRecordView];
//
//        [_timeRecordView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.todayMinuteNumberLabel.mas_bottom);
//            make.right.equalTo(self.floatView);
//            make.left.equalTo(self.floatView);
//            make.height.equalTo(@200);
//            
//        }];
//        
//        UILabel *cumulationTitleLabel = [UILabel new];
//        cumulationTitleLabel.text = @"Cumulation";
//        cumulationTitleLabel.textColor = [UIColor whiteColor];
//        cumulationTitleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
//        [_timeRecordView addSubview:cumulationTitleLabel];
//        [cumulationTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(_timeRecordView).offset(8);
//            make.right.equalTo(_timeRecordView).offset(-8);
//            
//        }];
//        
//        
//        UILabel *cumulationTimeLabel = [UILabel new];
//        cumulationTimeLabel.text = @"77:40:00";
//        cumulationTimeLabel.textColor = [UIColor whiteColor];
//        cumulationTimeLabel.font = [UIFont systemFontOfSize:52 weight:UIFontWeightLight];
//        [_timeRecordView addSubview:cumulationTimeLabel];
//        [cumulationTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(cumulationTitleLabel.mas_bottom);
//            make.right.equalTo(cumulationTitleLabel.mas_right);
//        }];
//        
//        
//        
//    }
//    
//    return _timeRecordView;
//}





@end
