//
//  ViewController.m
//  MyMoment
//
//  Created by 叶帆 on 8/26/15.
//  Copyright (c) 2015 kuyeluofan. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tomatoImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sloganLabel;

@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    
    
    [UIView animateWithDuration:1.5 animations:^{
        
        
        self.tomatoImage.frame = CGRectMake(self.tomatoImage.frame.origin.x, self.tomatoImage.frame.origin.y + 20, self.tomatoImage.frame.size.width, self.tomatoImage.frame.size.height);
        
    }];
   
    
    [UIView animateWithDuration:2.0 animations:^{
        self.titleLabel.alpha = 1;
        self.sloganLabel.alpha = 1;
    } completion:^(BOOL finished) {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MainViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
        [self presentViewController:mainViewController animated:NO completion:nil];
        
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
