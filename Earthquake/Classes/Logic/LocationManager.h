//
//  LocationManager.h
//  Earthquake
//
//  Created by Marta López Martos on 23/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationManagerDelegate <NSObject>

- (void)didUpdateLocation:(CLLocation*)location;

@end

@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocation *userLocation;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, weak) id<LocationManagerDelegate> delegate;

// Get the shared instance and create it if necessary.
+ (LocationManager *)sharedInstance;

- (void)start;

@end
