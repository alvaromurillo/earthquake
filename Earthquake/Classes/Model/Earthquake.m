//
//  Earthquake.m
//  Earthquake
//
//  Created by Marta López Martos on 22/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import "Earthquake.h"

@implementation Earthquake

+ (id)earthquakeFromDictionary:(NSDictionary *)dictionary {
	
	Earthquake *earthquake = [[Earthquake alloc] init];
	earthquake.title = dictionary[@"title"];
	NSNumber *latitude = dictionary[@"latitude"];
	NSNumber *longitude = dictionary[@"longitude"];
	if (latitude && longitude) {
		earthquake.coordinate = CLLocationCoordinate2DMake(latitude.doubleValue, longitude.doubleValue);
	}
	NSNumber *magnitude = dictionary[@"magnitude"];
	earthquake.magnitude = magnitude.doubleValue;
	earthquake.subtitle = [NSString stringWithFormat:@"%@: %.1f", NSLocalizedString(@"_magnitude", @""), magnitude.floatValue];
	
	return earthquake;
}

- (double)distance:(CLLocation*)location {
	
	CLLocation *earthquakeLocation = [[CLLocation alloc] initWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
	
	return [earthquakeLocation distanceFromLocation:location];
}

@end
