//
//  Weather.h
//  Weather Playground
//
//  Created by Ryan S. Watt on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (nonatomic, strong) NSString * locationName;
@property (nonatomic, strong) NSString * weatherMain;
@property (nonatomic, strong) NSString * weatherDescription;
@property (nonatomic, strong) NSString * weatherIcon;
@property (nonatomic, strong) NSString * weatherTemp;

- (id)initWithDictionary: (NSDictionary *)dictionary;


@end
