//
//  EarthquakesMapViewController.h
//  Earthquake
//
//  Created by Marta López Martos on 17/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Earthquake.h"

@interface EarthquakesMapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) NSArray *earthquakes;
@property (nonatomic, strong) Earthquake *selectedEarthquake;

@property (nonatomic) BOOL openedFromPush;

@end
