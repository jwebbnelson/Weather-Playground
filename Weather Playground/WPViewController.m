//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "Weather.h"
#import "WeatherController.h"
#import "UIImageView+AFNetworking.h"

@interface WPViewController ()
@property (strong, nonatomic) IBOutlet UITextField *searchField;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *mainLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *tempLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)search:(UIButton *)sender {
    
    NSString *name = [self.searchField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[WeatherController sharedInstance] getWeatherWithName:name completion:^(Weather *weather)
     {
        self.nameLabel.text = weather.locationName;
        self.mainLabel.text = weather.weatherMain;
        self.descriptionLabel.text = weather.weatherDescription;
         self.tempLabel.text = [NSString stringWithFormat:@"%.1f C", [self celsiusFromKelvin:weather.weatherTemp]];
        
         NSString *pictureString = weather.weatherMain;
         UIImage *image = [UIImage imageNamed:pictureString];
         [self.imageView setImage:image];
    }];
    
}
     
- (double)celsiusFromKelvin:(NSString *)kelvin {
 
    double kelvinDouble = [kelvin doubleValue];
    return kelvinDouble - 273.15;
 
}
     

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
