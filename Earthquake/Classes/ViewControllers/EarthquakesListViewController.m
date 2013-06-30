//
//  ViewController.m
//  Earthquake
//
//  Created by Marta López Martos on 17/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import "EarthquakesListViewController.h"
#import "EarthquakeCell.h"
#import "EarthquakesLogic.h"
#import "EarthquakesMapViewController.h"

@interface EarthquakesListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation EarthquakesListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	LocationManager *locationManager = [LocationManager sharedInstance];
	[locationManager setDelegate:self];
	[locationManager start];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateEarthquakes:(CLLocation *)userLocation {
	
	[[EarthquakesLogic sharedInstance] getEarthquakesForLocation:userLocation.coordinate onCompletion:^(NSArray *earthquakes) {
		self.earthquakes = earthquakes;
		[self.tableView reloadData];
	} onFailure:^(NSError *error) {
		// TODO: Mostrar error
	}];
}

#pragma mark – Metodos heredados de UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.earthquakes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = @"EarthquakeCell";
	EarthquakeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	[cell setEarthquake:[self.earthquakes objectAtIndex:indexPath.row]];
	
	return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([segue.identifier isEqualToString:@"EarthquakesMap"]) {
		NSInteger index = self.tableView.indexPathForSelectedRow.row;
		EarthquakesMapViewController *earthquakesMapVC = segue.destinationViewController;
		earthquakesMapVC.earthquakes = self.earthquakes;
		earthquakesMapVC.selectedEarthquake = [self.earthquakes objectAtIndex:index];
	}
}

#pragma mark – Metodos heredados de LocationManagerDelegate

- (void)didUpdateLocation:(CLLocation *)location {
	
	[self updateEarthquakes:location];
}


@end
