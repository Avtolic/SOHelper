//
//  AVTViewController.m
//  SOHelper
//
//  Created by Yury on 22.03.14.
//  Copyright (c) 2014 Yury. All rights reserved.
//

#import "AVTViewController.h"
#import "AVTSecondViewController.h"

@interface AVTViewController ()

@end

@implementation AVTViewController
{
    UITextField *_textField;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 200, 260, 25)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(30, 250, 260, 40);
    [button setTitle:@"Process country" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)onButton
{
    AVTSecondViewController *secondVC = [AVTSecondViewController new];
    secondVC.selectedCountryCode = _textField.text;
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
