//
//  LocationManager.m
//  Earthquake
//
//  Created by Marta López Martos on 23/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

// Get the shared instance and create it if necessary.
+ (LocationManager *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static LocationManager *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

- (void)start {
	
	if (!self.locationManager) {
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.delegate = self;
	}
	
	self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    [self.locationManager startUpdatingLocation];
	
}

#pragma mark – Metodos heredados de CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	
	self.userLocation = newLocation;
	
	if (self.delegate) {
		[self.delegate didUpdateLocation:self.userLocation];
	}
}


@end
