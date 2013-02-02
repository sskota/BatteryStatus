//
//  AppController.m
//  BatteryStatus
//

#import "AppController.h"
#import "BatteryStatus.h"

@implementation AppController

@synthesize displayText;

- (void)awakeFromNib
{
    BatteryStatus *status = [[BatteryStatus alloc] init];
    
    // BTキーボードのバッテリー残量取得
    NSString *keybordBattery = [status getBTKeyboardBatteryPersent];
    keybordBattery = [NSString stringWithFormat:@"%@ %@\n", NSLocalizedString(@"BTKEYBORD_BATTERY", @""), keybordBattery];
    
    // BTマウスのバッテリー残量取得
    NSString *mouseBattery = [status getBTMouseBatteryPersent];
    mouseBattery = [NSString stringWithFormat:@"%@ %@\n", NSLocalizedString(@"BTMOUSE_BATTERY", @""), mouseBattery];
    
    // BTトラックパッドのバッテリー残量取得
    NSString *trackpadBattery = [status getBTTrackpadBatteryPersent];
    trackpadBattery = [NSString stringWithFormat:@"%@ %@\n", NSLocalizedString(@"BTTRACKPAD_BATTERY", @""), trackpadBattery];
    
    displayText = [NSString stringWithFormat:@"%@%@%@",keybordBattery, mouseBattery, trackpadBattery];
    
    // テキストビューに貼り付け
    [self updateDisplayTextView];
}

-(void)updateDisplayTextView
{
    [textView setBackgroundColor:[NSColor clearColor]];
    [textView setTextColor:[NSColor whiteColor]];
    [textView setString:displayText];
}

@end
