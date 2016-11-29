//
//  UIScrollView+ContentView.m
//  UIScrollViewAutolayout
//
//  Created by NSSimpleApps on 29.11.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "UIScrollView+ContentView.h"

@implementation UIView (SubView)

- (void)addSubview:(UIView *)subview withInsets:(UIEdgeInsets)insets {
    
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:subview];
    
    NSLayoutConstraint *top =
    [NSLayoutConstraint constraintWithItem:subview
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeTop
                                multiplier:1
                                  constant:insets.top];
    NSLayoutConstraint *bottom =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:subview
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:insets.bottom];
    NSLayoutConstraint *left =
    [NSLayoutConstraint constraintWithItem:subview
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1
                                  constant:insets.left];
    NSLayoutConstraint *right =
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:subview
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1
                                  constant:insets.right];
    
    [NSLayoutConstraint activateConstraints:@[top, bottom, left, right]];
}

@end


@implementation UIScrollView (ContainerView)

- (UIView *)contentViewWithInsets:(UIEdgeInsets)insets {
    
    UIView *contentView = [[UIView alloc] initWithFrame:self.bounds];
    
    [self addSubview:contentView withInsets:insets];
    
    NSLayoutConstraint *centerX =
    [NSLayoutConstraint constraintWithItem:contentView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1
                                  constant:0];
    NSLayoutConstraint *centerY =
    [NSLayoutConstraint constraintWithItem:contentView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1
                                  constant:0];
    [NSLayoutConstraint activateConstraints:@[centerX, centerY]];
    
    return contentView;
}

@end
