//
//  UIScrollView+ContentView.h
//  UIScrollViewAutolayout
//
//  Created by NSSimpleApps on 29.11.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SubView)

- (void)addSubview:(UIView *)subview withInsets:(UIEdgeInsets)insets;

@end


@interface UIScrollView (ContainerView)

- (UIView *)contentViewWithInsets:(UIEdgeInsets)insets;

@end

NS_ASSUME_NONNULL_END
