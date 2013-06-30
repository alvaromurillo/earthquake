//
//  EarthquakeCell.m
//  Earthquake
//
//  Created by Marta López Martos on 22/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import "EarthquakeCell.h"
#import "LocationManager.h"

@implementation EarthquakeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setEarthquake:(Earthquake *)earthquake {
	
	_earthquake = earthquake;
	
	if (earthquake) {
		self.titleLabel.text = earthquake.title;
		self.magnitudeLabel.text = [NSString stringWithFormat:@"%0.1f", earthquake.magnitude];
		CLLocation *userLocation = [LocationManager sharedInstance].userLocation;
		double distance = [earthquake distance:userLocation]/1000;
		if (distance < 1) {
			self.distanceLabel.text = [NSString stringWithFormat:@"%0.1f %@", distance, NSLocalizedString(@"_meters", @"")];
		} else {
			self.distanceLabel.text = [NSString stringWithFormat:@"%0.1f %@", distance, NSLocalizedString(@"_kilometers", @"")];
		}
		
	}
}

@end
