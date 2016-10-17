//
//  WDSegmentedViewController.m
//
//  Created by Hackice on 16/10/17.
//  Copyright © 2016年 Hackice. All rights reserved.
//

#import "HESegmentedViewController.h"

@interface HESegmentedViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSMutableArray *barButtomItemArray;
@property (nonatomic, strong) UIView *whiteBar;

@end

@implementation HESegmentedViewController

- (instancetype)initWithTitle:(NSString *)title {

    if (self = [super init]) {
        self.navigationItem.title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _barButtomItemArray = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.segmentedControl];
    
    [self selectedWithIndex:0];
}

- (void)setTintColor:(UIColor *)tintColor {
    
    _tintColor = tintColor;
    self.segmentedControl.tintColor = tintColor;
}

#pragma mark Lazy init
- (UISegmentedControl *)segmentedControl {

    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(15, 74, [UIScreen mainScreen].bounds.size.width - 30, 29)];
        _segmentedControl.tintColor = [UIColor blueColor];
        [_segmentedControl addTarget:self action:@selector(segmentedControlSelected:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}

- (UIView *)whiteBar {

    if (!_whiteBar) {
        _whiteBar = [[UIView alloc] initWithFrame:CGRectMake(0, 74+29, [UIScreen mainScreen].bounds.size.width, 10)];
        _whiteBar.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_whiteBar];
    }
    return _whiteBar;
}

#pragma mark Action Method
- (void)selectedWithIndex:(NSInteger)index {
    
    if (index > self.childViewControllers.count - 1) return;
    
    self.segmentedControl.selectedSegmentIndex = index;
    [self segmentedControlSelected:self.segmentedControl];
}

- (void)segmentedControlSelected:(UISegmentedControl *)segmentedControl {
    UIView *childControllerView = [self.childViewControllers[segmentedControl.selectedSegmentIndex] view];
    
    if (self.showBarOnListTop) {
        [self.view insertSubview:childControllerView belowSubview:self.whiteBar];
    } else {
        [self.view addSubview:childControllerView];
    }
    childControllerView.frame = CGRectMake(0, 74+29, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 74 - 29);
}

- (void)addChildViewController:(UIViewController *)childController Title:(NSString *)title {
    
    [self addChildViewController:childController];
    [self.segmentedControl insertSegmentWithTitle:title atIndex:self.childViewControllers.count - 1 animated:NO];
}

- (void)addRightBarButtonItemWithTitle:(NSString *)title action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    
    [_barButtomItemArray addObject:item];
    [self setupRightBarButtonItems];
}

- (void)addRightBarButtonItemWithImage:(UIImage *)image action:(SEL)action {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
    [_barButtomItemArray addObject:item];
    [self setupRightBarButtonItems];
}

- (void)setupRightBarButtonItems {
    if ([_barButtomItemArray count] == 1) {
        self.navigationItem.rightBarButtonItem = _barButtomItemArray[0];
    } else {
        self.navigationItem.rightBarButtonItems = [_barButtomItemArray copy];
    }
}

#pragma mark Other
- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
