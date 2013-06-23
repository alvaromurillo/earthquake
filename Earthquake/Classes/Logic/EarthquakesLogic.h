//
//  EarthquakesLogic.h
//  Earthquake
//
//  Created by Álvaro Murillo del Puerto on 22/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface EarthquakesLogic : NSObject

// Get the shared instance and create it if necessary.
+ (EarthquakesLogic *)sharedInstance;

- (void)getEarthquakesForLocation:(CLLocationCoordinate2D)location
					 onCompletion:(void (^)(NSArray *earthquakes))success
						onFailure:(void (^)(NSError *error))failure;

@end
