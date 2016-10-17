//
//  WDPageTagViewController.h
//
//  Created by Hackice on 16/10/17.
//  Copyright © 2016年 namedfish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HEPageTagViewController : UIViewController

- (void)addChildViewController:(UIViewController *)childController Title:(NSString *)title;
/**
 *   [!]It's required after addChildViewController
 *   [!]在添加完子控制器之后必须实现该方法
 */
- (void)loadingControllers;
- (void)selectedWithIndex:(NSUInteger)index;
- (void)disableScroll; // 关闭滑动功能

@end
