//
//  SegmentedViewController.m
//  HEPageTagViewControllerDemo
//
//  Created by Hackice on 2016/10/17.
//  Copyright © 2016年 Hackice. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()

@end

@implementation SegmentedViewController

- (void)loadView {
    [super loadView];
    
    UIViewController *childVC1 = [UIViewController new];
    childVC1.view.backgroundColor = [UIColor redColor];
    UIViewController *childVC2 = [UIViewController new];
    childVC2.view.backgroundColor = [UIColor greenColor];
    UIViewController *childVC3 = [UIViewController new];
    childVC3.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:childVC1 Title:@"red"];
    [self addChildViewController:childVC2 Title:@"green"];
    [self addChildViewController:childVC3 Title:@"yellow"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
