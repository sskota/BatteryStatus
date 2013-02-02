//
//  AppController.h
//  BatteryStatus
//
//  Created by kota on 2013/02/02.
//
//

#import <Cocoa/Cocoa.h>

@interface AppController : NSObject
{
    IBOutlet NSTextView *textView;
}

@property (retain) NSString *displayText;

@end
