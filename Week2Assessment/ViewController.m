//
//  ViewController.m
//  Week2Assessment
//
//  Created by Shannon Beck on 1/16/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import "ViewController.h"
#import "Cities.h"
#import "CityDetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, DetailDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *citiesArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    Cities *Greenville = [[Cities alloc]init];
    Greenville.cityName = @"Greenville";
    Greenville.cityState = @"SC";
    Greenville.cityImage.image = [UIImage imageNamed:@"GreenvilleSC.jpg"];
    Greenville.cityImageName = @"GreenvilleSC.jpg";
    Greenville.url = @"http://en.wikipedia.org/wiki/Greenville,_South_Carolina";

    Cities *Charleston = [[Cities alloc]init];
    Charleston.cityName = @"Charleston";
    Charleston.cityState = @"SC";
    Charleston.cityImage.image = [UIImage imageNamed:@"CharlestonSC.jpg"];
    Charleston.cityImageName = @"CharlestonSC.jpg";
    Charleston.url = @"http://en.wikipedia.org/wiki/Charleston,_South_Carolina";

    Cities *LittleRock = [[Cities alloc]init];
    LittleRock.cityName = @"Little Rock";
    LittleRock.cityState = @"AR";
    LittleRock.cityImage.image = [UIImage imageNamed:@"LittleRockAR.jpg"];
    LittleRock.cityImageName = @"LittleRockAR.jpg";
    LittleRock.url = @"http://en.wikipedia.org/wiki/Little_Rock,_Arkansas";

    Cities *SanFrancisco = [[Cities alloc]init];
    SanFrancisco.cityName = @"San Francisco";
    SanFrancisco.cityState = @"CA";
    SanFrancisco.cityImage.image = [UIImage imageNamed:@"SanFranciscoCA.jpg"];
    SanFrancisco.cityImageName = @"SanFranciscoCA.jpg";
    SanFrancisco.url = @"http://en.wikipedia.org/wiki/San_Francisco";

    self.citiesArray = [NSMutableArray arrayWithObjects:Greenville,
        Charleston, LittleRock, SanFrancisco, nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.citiesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Cities *currentCity = [self.citiesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = currentCity.cityName;
    cell.detailTextLabel.text = currentCity.cityState;
    //cell.imageView = currentCity.cityImage;
    //[cell addSubview:currentCity.cityImage];
    cell.imageView.image = [UIImage imageNamed:currentCity.cityImageName];


    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.citiesArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)changeTitleButtonTapped: (Cities *)currentCity
{
    self.title = currentCity.cityName;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    if ([[segue identifier] isEqualToString:@"segueToDetail"])
    {
        CityDetailViewController *cdvc = segue.destinationViewController;

        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        Cities *thisCity = [self.citiesArray objectAtIndex:path.row];
        cdvc.currentCity = thisCity;
        cdvc.delegate = self;
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

@end
