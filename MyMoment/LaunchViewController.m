//
//  ViewController.m
//  MyMoment
//
//  Created by 叶帆 on 8/26/15.
//  Copyright (c) 2015 kuyeluofan. All rights reserved.
//

#import "LaunchViewController.h"
#import "MainViewController.h"

@interface LaunchViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tomatoImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sloganLabel;

@end

@implementation LaunchViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    [self prefersStatusBarHidden];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [UIView animateWithDuration:1.5 animations:^{
        
        self.tomatoImage.frame = CGRectMake(self.tomatoImage.frame.origin.x, self.tomatoImage.frame.origin.y + 30, self.tomatoImage.frame.size.width, self.tomatoImage.frame.size.height);
        
    }];
   
    
    [UIView animateWithDuration:2.0 animations:^{
        self.titleLabel.alpha = 1;
        self.sloganLabel.alpha = 1;
    } completion:^(BOOL finished) {
        
        [self performSelector:@selector(showMainViewController) withObject:nil afterDelay:0.8];
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMainViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [self presentViewController:mainViewController animated:NO completion:nil];
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
