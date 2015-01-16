//
//  CityDetailViewController.h
//  Week2Assessment
//
//  Created by Shannon Beck on 1/16/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cities.h"

@protocol DetailDelegate <NSObject>

-(void)changeTitleButtonTapped :(Cities *)currentCity;

@end

@interface CityDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityStateLabel;
@property (strong, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityStateTextField;
@property Cities *currentCity;

@property (nonatomic, weak) id<DetailDelegate> delegate;

@end
