//
//  Earthquake.h
//  Earthquake
//
//  Created by Álvaro Murillo del Puerto on 22/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Earthquake : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic) double magnitude;
@property (nonatomic, strong) NSDate *date;

+ (id)earthquakeFromDictionary:(NSDictionary *)dictionary;

- (double)distance:(CLLocation*)location;

@end
