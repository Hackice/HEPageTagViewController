//
//  WDSegmentedViewController.h
//
//  Created by Hackice on 16/10/17.
//  Copyright © 2016年 Hackice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HESegmentedViewController : UIViewController
// UISegmentedControl's tintColr, default is blue.
@property (nonatomic, strong) UIColor *tintColor;

/**
 *  Creat instance with a title.
 *
 *  @param title navigationItem's title
 *
 */
- (instancetype)initWithTitle:(NSString *)title;

/**
 *  @param childController childController
 *  @param title           UISegmentedControl's item title
 */
- (void)addChildViewController:(UIViewController *)childController Title:(NSString *)title;

- (void)addRightBarButtonItemWithTitle:(NSString *)title action:(SEL)action;

- (void)addRightBarButtonItemWithImage:(UIImage *)image action:(SEL)action;

/**
 *  Select Segmented item with index, default is 0.
 *
 *  @param index Segmented item index
 */
- (void)selectedWithIndex:(NSInteger)index;

/**
 *  Show a white bar on the top of the list.(height is 10)
 */
@property (nonatomic, assign) BOOL showBarOnListTop;

@end
