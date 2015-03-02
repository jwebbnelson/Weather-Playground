//
//  WeatherController.m
//  Weather Playground
//
//  Created by Ryan S. Watt on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//
#import "NetworkController.h"
#import "WeatherController.h"
#import "Weather.h"
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

-(void)getWeatherWithName:(NSString *)name completion:(void(^)(NSArray * weather))completion {
    
    NSString *path = [NSString stringWithFormat:@"name/%@", name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *responseWeathers = responseObject;
        NSMutableArray *weathers = [NSMutableArray array];
        for (NSDictionary *dictionary in responseWeathers) {
            Weather *weather = [[Weather alloc] initWithDictionary:dictionary];
            [weathers addObject:weather];
        }
        completion(weathers);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"eror getting weather %@", error);
        completion(nil);
    }];

}

@end
