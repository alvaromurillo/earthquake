//
//  ViewController.h
//  Earthquake
//
//  Created by Marta López Martos on 17/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"

@interface EarthquakesListViewController : UIViewController <UITableViewDataSource, LocationManagerDelegate>

@property (nonatomic, strong) NSArray *earthquakes;

@end
