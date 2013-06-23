//
//  EarthquakeCell.h
//  Earthquake
//
//  Created by Álvaro Murillo del Puerto on 22/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Earthquake.h"

@interface EarthquakeCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *magnitudeLabel;
@property (nonatomic, strong) IBOutlet UILabel *distanceLabel;

@property (nonatomic, strong) Earthquake *earthquake;

@end
