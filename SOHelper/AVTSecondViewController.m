//
//  AVTSecondViewController.m
//  SOHelper
//
//  Created by Yury on 22.03.14.
//  Copyright (c) 2014 Yury. All rights reserved.
//

#import "AVTSecondViewController.h"

@interface AVTSecondViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation AVTSecondViewController
{
    UIPickerView *_countryPicker;
    UITextField *_countryText;
    NSArray *countryCodes;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        countryCodes = @[@"one", @"two", @"three", @"four", @"five"];
    }
    return self;
}

- (void)viewDidLoad
{
    _countryText = [[UITextField alloc] initWithFrame:CGRectMake(30, 230, 260, 25)];
    _countryText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_countryText];

    _countryPicker = [[UIPickerView alloc] init];
    [self initPicker:_countryPicker textField:_countryText];
}

- (void)initPicker:(UIPickerView*)pickerView textField:(UITextField*) textField
{
    CGRect pickerFrame = CGRectMake(0, 100, 200, 216);
    pickerView.frame = pickerFrame;
    pickerView.userInteractionEnabled = YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = YES;
    [textField setInputView:pickerView];
}

- (void)viewDidAppear:(BOOL)animated
{
    for (int i = 0; i < [countryCodes count]; i++)
    {
        if ([countryCodes[i] isEqualToString:_selectedCountryCode]){
            [_countryPicker selectRow:i inComponent:0 animated:YES];
            break;
        }
    }
    [_countryPicker reloadAllComponents];
}

#pragma UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [countryCodes count];
}

#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return countryCodes[row];
}
@end
