//
//  WeatherController.m
//  Weather Playground
//
//  Created by Ryan S. Watt on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//
#import "NetworkController.h"
#import "WeatherController.h"
#import <AFNetworking/AFNetworking.h>

@implementation WeatherController

+ (WeatherController *)sharedInstance {
    static WeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WeatherController new];
    });
    return sharedInstance;
}

-(void)getWeatherWithName:(NSString *)name completion:(void(^)(Weather *weather))completion {
    
    NSString *path = [NSString stringWithFormat:@"weather?q=%@", name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseWeathers = responseObject;
        Weather *weather = [[Weather alloc] initWithDictionary:responseWeathers];
        completion(weather);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error getting weather %@", error);
        completion(nil);
    }];

}

@end
