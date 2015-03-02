//
//  WeatherController.h
//  Weather Playground
//
//  Created by Ryan S. Watt on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface WeatherController : NSObject

+ (instancetype)sharedInstance;

-(void)getWeatherWithName:(NSString *)name completion:(void(^)(Weather * weather))completion;

@end
