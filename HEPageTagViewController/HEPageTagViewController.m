//
//  WDPageTagViewController.m
//
//  Created by Hackice on 16/10/17.
//  Copyright © 2016年 namedfish. All rights reserved.
//

#import "HEPageTagViewController.h"
#import "SMPagerTabView.h"

@interface HEPageTagViewController ()<SMPagerTabViewDelegate>

@property (nonatomic, strong) NSMutableArray *allVC;// 子控制器数组
@property (nonatomic, strong) SMPagerTabView *segmentView;

@end

@implementation HEPageTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)disableScroll
{
    self.segmentView.disableScroll = YES;
}

#pragma mark - Action Method
- (void)addChildViewController:(UIViewController *)childController Title:(NSString *)title {
    
    [self addChildViewController:childController];
    childController.title = title;
    [self.allVC addObject:childController];
}

- (void)loadingControllers {
    
    self.segmentView.delegate = self;
    
    [_segmentView buildUI];
    [_segmentView selectTabWithIndex:0 animate:NO];
}

- (void)selectedWithIndex:(NSUInteger)index {

    [self.segmentView selectTabWithIndex:index animate:YES];
}

#pragma mark - DBPagerTabView Delegate
- (NSUInteger)numberOfPagers:(SMPagerTabView *)view {
    return [self.allVC count];
}

- (UIViewController *)pagerViewOfPagers:(SMPagerTabView *)view indexOfPagers:(NSUInteger)number {
    return self.allVC[number];
}

- (void)whenSelectOnPager:(NSUInteger)number {
//    NSLog(@"Selected Page %lu",(unsigned long)number);
}

#pragma mark - Lazy Init
- (NSMutableArray *)allVC {
    
    if (!_allVC) {
        
        _allVC = [NSMutableArray array];
    }
    return _allVC;
}

- (SMPagerTabView *)segmentView {
    
    if (!_segmentView) {
        
        self.segmentView = [[SMPagerTabView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height-64)];
        [self.view addSubview:_segmentView];
    }
    return _segmentView;
}

@end
