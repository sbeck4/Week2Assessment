//
//  CityDetailViewController.m
//  Week2Assessment
//
//  Created by Shannon Beck on 1/16/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import "CityDetailViewController.h"
#import "WebPageViewController.h"

@interface CityDetailViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButtonOutlet;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *webPageLabelButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CityDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cityNameLabel.text = self.currentCity.cityName;
    self.cityStateLabel.text = self.currentCity.cityState;
    self.cityNameTextField.placeholder = self.currentCity.cityName;
    self.cityStateTextField.placeholder = self.currentCity.cityState;
    self.cityNameTextField.hidden = YES;
    self.cityStateTextField.hidden = YES;
    self.imageView.image = [UIImage imageNamed:self.currentCity.cityImageName];
}

- (IBAction)changeTitleNameButton:(id)sender
{
    [self.delegate changeTitleButtonTapped:self.currentCity];
}

- (IBAction)editButton:(id)sender
{
    if ([self.editButtonOutlet.title isEqualToString:@"Edit"])
    {
        self.cityNameTextField.placeholder = self.currentCity.cityName;
        self.cityStateTextField.placeholder = self.currentCity.cityState;
        self.cityNameTextField.hidden = NO;
        self.cityStateTextField.hidden = NO;

        self.cityNameLabel.hidden = YES;
        self.cityStateLabel.hidden = YES;

        self.editButtonOutlet.title = @"Done";
    }
    else
    {
        self.cityNameTextField.hidden = YES;
        self.cityStateTextField.hidden = YES;

        self.cityNameLabel.text = self.cityNameTextField.text;
        self.currentCity.cityName = self.cityNameTextField.text;
        self.cityStateLabel.text = self.cityStateTextField.text;
        self.currentCity.cityState = self.cityStateTextField.text;

       self.cityNameLabel.hidden = NO;
        self.cityStateLabel.hidden = NO;

        [self.cityNameTextField resignFirstResponder];
        [self.cityStateTextField resignFirstResponder];

        self.editButtonOutlet.title = @"Edit";
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    if ([[segue identifier] isEqualToString:@"segueToWebPage"])
    {
        WebPageViewController *wpvc = segue.destinationViewController;

        wpvc.currentCity = self.currentCity;
    }
    
}

- (IBAction)webPageLabelButton:(id)sender
{

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
