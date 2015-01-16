//
//  WebPageViewController.m
//  Week2Assessment
//
//  Created by Shannon Beck on 1/16/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import "WebPageViewController.h"
#import "CityDetailViewController.h"

@interface WebPageViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WebPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *addressURL = [NSURL URLWithString:self.currentCity.url];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
    [self.webView loadRequest:addressRequest];

}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
    self.spinner.hidden = false;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
    self.spinner.hidden = true;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    if ([[segue identifier] isEqualToString:@"segueBack"])
    {
        CityDetailViewController *cdvc = segue.destinationViewController;

        cdvc.currentCity = self.currentCity;
    }
    
}

- (IBAction)closeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
