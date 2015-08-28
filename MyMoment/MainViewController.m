//
//  MainViewController.m
//  MyMoment
//
//  Created by 叶帆 on 8/26/15.
//  Copyright (c) 2015 kuyeluofan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *switchButton;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *todayMinuteNumberLabel;
@property (weak, nonatomic, getter = startTimer)  NSTimer *timer;
@property  (nonatomic) NSUInteger countTimeSecondNumber;
@property (nonatomic) NSUInteger tomatoTimeSecondNumber;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:1];
    self.switchButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.tomatoTimeSecondNumber = 1500;
    // Do any additional setup after loading the view.
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

- (IBAction)switchButtonClick:(id)sender {
    if ([self.switchButton.currentTitle isEqualToString:@"Start"]) {
        //点击开始倒计时
        
        self.countTimeSecondNumber = self.tomatoTimeSecondNumber;
        [self startTimer];
        
        [self.switchButton setTitle:@"Cancel" forState:UIControlStateNormal];
    } else {
        //点击取消计时
        [self.timer invalidate];
        
        self.countTimeSecondNumber = self.tomatoTimeSecondNumber;
        [self.switchButton setTitle:@"Start" forState:UIControlStateNormal];
    }
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

- (void)countDown{
    
    if (self.countTimeSecondNumber == 0) {
        [self.timer invalidate];
        
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
    }
    return _timer;
    
}

- (void)setCountTimeSecondNumber:(NSUInteger)countTimeSecondNumber{
    
    _countTimeSecondNumber = countTimeSecondNumber;
    self.timerLabel.text = [self countDownStringFromSeconds:_countTimeSecondNumber];
    
}





@end
