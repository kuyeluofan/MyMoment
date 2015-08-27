//
//  MainViewController.m
//  MyMoment
//
//  Created by 叶帆 on 8/26/15.
//  Copyright (c) 2015 kuyeluofan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:1];
    self.startButton.layer.borderColor = [UIColor whiteColor].CGColor;
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
@end
