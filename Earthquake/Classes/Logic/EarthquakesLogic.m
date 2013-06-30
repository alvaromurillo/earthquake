//
//  EarthquakesLogic.m
//  Earthquake
//
//  Created by Marta López Martos on 22/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import "EarthquakesLogic.h"
#import "AFJSONRequestOperation.h"
#import "Earthquake.h"

@implementation EarthquakesLogic

// Get the shared instance and create it if necessary.
+ (EarthquakesLogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static EarthquakesLogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

- (void)getEarthquakesForLocation:(CLLocationCoordinate2D)coordinate
					 onCompletion:(void (^)(NSArray *earthquakes))success
						onFailure:(void (^)(NSError *error))failure {
	
	NSURL *url = [NSURL URLWithString:kURL_Earthquakes_Service];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
		
		NSDictionary *jsonDict = (NSDictionary *) JSON;
		NSArray *eartquakesDictArray = jsonDict[@"earthquakes"];
		
		if (eartquakesDictArray) {
			NSMutableArray *earthquakes = [NSMutableArray arrayWithCapacity:eartquakesDictArray.count];
			for (NSDictionary *earthquakeDict in eartquakesDictArray) {
				
				Earthquake *earthquake = [Earthquake earthquakeFromDictionary:earthquakeDict];
				[earthquakes addObject:earthquake];
				
			}
			
			NSArray *sortedEarthquakes = [self sortEarthquakes:earthquakes byLocation:coordinate];
			if (success) {
				success(sortedEarthquakes);
			}
		}
		
	} failure:nil];
	[operation start];
}

- (NSArray *)sortEarthquakes:(NSArray *)earthquakes byLocation:(CLLocationCoordinate2D)coordinate {
	
	CLLocation *userLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
	
	NSArray *sortedEarthquakes = [earthquakes sortedArrayUsingComparator:^NSComparisonResult(Earthquake *e1, Earthquake *e2) {
		
		CLLocation *loc1 = [[CLLocation alloc] initWithLatitude:e1.coordinate.latitude longitude:e1.coordinate.longitude];
		CLLocation *loc2 = [[CLLocation alloc] initWithLatitude:e2.coordinate.latitude longitude:e2.coordinate.longitude];
		
		CLLocationDistance distanceA = [loc1 distanceFromLocation:userLocation];
		CLLocationDistance distanceB = [loc2 distanceFromLocation:userLocation];
		if (distanceA < distanceB) {
			return NSOrderedAscending;
		} else if (distanceA > distanceB) {
			return NSOrderedDescending;
		} else {
			return NSOrderedSame;
		}
		
	}];
	
	return sortedEarthquakes;
}

@end
