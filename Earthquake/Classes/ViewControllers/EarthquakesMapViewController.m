//
//  EarthquakesMapViewController.m
//  Earthquake
//
//  Created by Marta López Martos on 17/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import "EarthquakesMapViewController.h"

#define METERS_PER_MILE 1609.344

@interface EarthquakesMapViewController ()

@property (nonatomic, weak) IBOutlet MKMapView *mapview;

@end

@implementation EarthquakesMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[self.mapview setShowsUserLocation:YES];
//	[self.mapview setUserTrackingMode:MKUserTrackingModeFollow];
	
	if (self.openedFromPush) {
		[self.mapview addAnnotation:self.selectedEarthquake];
		UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Cerrar" style:UIBarButtonItemStyleDone target:self action:@selector(closeView:)];
		[self.navigationItem setRightBarButtonItem:doneButton];
		[self.navigationItem setTitle:self.selectedEarthquake.title];
	} else {
		[self.mapview addAnnotations:self.earthquakes];
	}
	
	[self.mapview setRegion:MKCoordinateRegionMakeWithDistance(self.selectedEarthquake.coordinate, METERS_PER_MILE * 5, METERS_PER_MILE * 5)];
}

- (void)closeView:(id)sender {
	
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – Metodos heredados de MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	
//	static NSString *identifier = @"earquakeAnnotation";
//	MKAnnotationView 
//	return [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
	return nil;
}


@end
