//
//  MainViewController.m
//  MyMoment
//
//  Created by 叶帆 on 8/26/15.
//  Copyright (c) 2015 kuyeluofan. All rights reserved.
//

#import "MainViewController.h"
#import <Masonry.h>


@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *switchButton;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *todayMinuteNumberLabel;
@property (weak, nonatomic, getter = startTimer)  NSTimer *timer;
@property (strong, nonatomic) UIView *timeRecordView;
@property (weak, nonatomic) IBOutlet UIView *floatView;

@property  (nonatomic) NSUInteger countTimeSecondNumber;
@property (nonatomic) NSUInteger tomatoTimeSecondNumber;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:1];
    self.switchButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.tomatoTimeSecondNumber = 10;
    self.countTimeSecondNumber = self.tomatoTimeSecondNumber;
    
    
    
    [self timeRecordView];//TODO:应该和初始化一起做
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
        //点击开始倒计时
        [self startTimer];
        
    } else {
        //点击取消计时
       
        [self stopTimer];
      
    }
}


- (IBAction)tapScreen:(id)sender {
   //TODO:背景高斯模糊
 
   
    [UIView animateWithDuration:0.3 animations:^{
//        self.timeRecordView.frame = CGRectMake(self.timeRecordView.frame.origin.x, self.timeRecordView.frame.origin.y - 108, self.timeRecordView.frame.size.width, self.timeRecordView.frame.size.height + 1000);
        
        self.floatView.frame = CGRectMake(self.floatView.frame.origin.x, self.floatView.frame.origin.y - 104, self.timeRecordView.frame.size.width, self.floatView.frame.size.height);
        
    }];
    
    
    
}

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

- (void)stopTimer{
    
    [self.timer invalidate];
    self.countTimeSecondNumber = self.tomatoTimeSecondNumber;
    [self.switchButton setTitle:@"Start" forState:UIControlStateNormal];
    
}

- (void)countDown{
    
    if (self.countTimeSecondNumber == 0) {
        
        [self stopTimer];
        
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
    
    NSString *minutesAndSecondsString = [NSString stringWithFormat:@"%ld:%02ld", minutes, seconds];
    return minutesAndSecondsString;
}


#pragma mark - getter and setter

- (NSTimer *)startTimer{
    
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        self.countTimeSecondNumber = self.tomatoTimeSecondNumber;
        [self.switchButton setTitle:@"Cancel" forState:UIControlStateNormal];
    }
    
    return _timer;
    
}

- (void)setCountTimeSecondNumber:(NSUInteger)countTimeSecondNumber{
    
    if (_countTimeSecondNumber != countTimeSecondNumber) {
        _countTimeSecondNumber = countTimeSecondNumber;
        self.timerLabel.text = [self countDownStringFromSeconds:_countTimeSecondNumber];
    }
    
}

- (UIView *)timeRecordView{
    
    //TODO:滑动应该用UIScrollView实现
    
    if (!_timeRecordView) {
        _timeRecordView = [UIView new];
        _timeRecordView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self.floatView addSubview:_timeRecordView];

        [_timeRecordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.todayMinuteNumberLabel.mas_bottom);
            make.right.equalTo(self.floatView);
            make.left.equalTo(self.floatView);
            make.height.equalTo(@200);
            
        }];
        
        UILabel *cumulationTitleLabel = [UILabel new];
        cumulationTitleLabel.text = @"Cumulation";
        cumulationTitleLabel.textColor = [UIColor whiteColor];
        cumulationTitleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
        [_timeRecordView addSubview:cumulationTitleLabel];
        [cumulationTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_timeRecordView).offset(8);
            make.right.equalTo(_timeRecordView).offset(-8);
            
        }];
        
        
        UILabel *cumulationTimeLabel = [UILabel new];
        cumulationTimeLabel.text = @"77:40:00";
        cumulationTimeLabel.textColor = [UIColor whiteColor];
        cumulationTimeLabel.font = [UIFont systemFontOfSize:52 weight:UIFontWeightLight];
        [_timeRecordView addSubview:cumulationTimeLabel];
        [cumulationTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cumulationTitleLabel.mas_bottom);
            make.right.equalTo(cumulationTitleLabel.mas_right);
        }];
        
        
        
    }
    
    return _timeRecordView;
}





@end
