//
//  ViewController.m
//  UIScrollViewAutolayout
//
//  Created by NSSimpleApps on 29.11.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+ContentView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (strong) UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Scroll View";
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.minimumZoomScale = 1;
    scrollView.maximumZoomScale = 5;
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    NSLayoutConstraint *top =
    [NSLayoutConstraint constraintWithItem:scrollView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.topLayoutGuide
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:0];
    NSLayoutConstraint *bottom =
    [NSLayoutConstraint constraintWithItem:self.bottomLayoutGuide
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:scrollView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:0];
    NSLayoutConstraint *left =
    [NSLayoutConstraint constraintWithItem:scrollView
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeadingMargin
                                multiplier:1
                                  constant:-16];
    NSLayoutConstraint *right =
    [NSLayoutConstraint constraintWithItem:self.view
                                 attribute:NSLayoutAttributeTrailingMargin
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:scrollView
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1
                                  constant:-16];
    
    [NSLayoutConstraint activateConstraints:@[top, bottom, left, right]];
    
    self.contentView = [scrollView contentViewWithInsets:UIEdgeInsetsZero];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    imageView.image = [UIImage imageNamed:@"rule.png"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview:imageView withInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.contentView;
}

@end
