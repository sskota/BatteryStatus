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
    [self performSelectorInBackground:@selector(createBatteryStatusText) withObject:nil];
}

-(void)createBatteryStatusText
{
    BatteryStatus *status = [[BatteryStatus alloc] init];
    
    // バッテリーの接続状況取得
    BOOL extCon = [status getNoteBatteryExternalConnect];
    NSString *externalConnected = [[NSString alloc] init];
    if (extCon) {
        externalConnected =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"EXTERNAL_CONNECTED", @""),
             NSLocalizedString(@"YES", @"")];
    }
    else {
        externalConnected =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"EXTERNAL_CONNECTED", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    // バッテリーの充電状況取得
    BOOL batFully = [status getNoteBatteryIsFully];
    NSString *batteryIsFully = [[NSString alloc] init];
    if (batFully) {
        batteryIsFully =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BATTERY_IS_FULLY", @""),
             NSLocalizedString(@"YES", @"")];
    }
    else {
        batteryIsFully =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BATTERY_IS_FULLY", @""),
             NSLocalizedString(@"NO", @"")];
    }
    
    // バッテリー残り時間取得
    NSString *batteryTimeLeft = [status getNoteBatteryTimeLeft];
    if (![batteryTimeLeft isEqualToString:@""]) {
        batteryTimeLeft =
            [NSString stringWithFormat:@"%@ %@min\n",
             NSLocalizedString(@"BATTERY_TIMELEFT", @""),
             batteryTimeLeft];
    }
    else {
        batteryTimeLeft =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BATTERY_TIMELEFT", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    // バッテリー充電率取得
    NSString *batteryPercent = [status getNoteBatteryPercent];
    if (![batteryPercent isEqualToString:@""]) {
        batteryPercent =
            [NSString stringWithFormat:@"%@ %@%%\n",
             NSLocalizedString(@"BATTERY_PERCENT", @""),
             batteryPercent];
    }
    else {
        batteryPercent =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BATTERY_PERCENT", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    // バッテリー健康度取得
    NSString *batteryHelth = [status getNoteBatteryHelth];
    if (![batteryHelth isEqualToString:@""]) {
        batteryHelth =
            [NSString stringWithFormat:@"%@ %@%%\n",
             NSLocalizedString(@"BATTERY_HELTH", @""),
             batteryHelth];
    }
    else {
        batteryHelth =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BATTERY_HELTH", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    // バッテリー容量取得
    NSString *batteryCurrentCapacity = [status getNoteBatteryCurrentCapacity];
    if (![batteryCurrentCapacity isEqualToString:@""]) {
        batteryCurrentCapacity =
            [NSString stringWithFormat:@"%@ %@mAh\n",
             NSLocalizedString(@"BATTERY_CURRENT_CAPACITY", @""),
             batteryCurrentCapacity];
    }
    else {
        batteryCurrentCapacity =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BATTERY_CURRENT_CAPACITY", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    // バッテリー最大容量取得
    NSString *batteryMaxCapacity = [status getNoteBatteryMaxCapacity];
    if (![batteryMaxCapacity isEqualToString:@""]) {
        batteryMaxCapacity =
            [NSString stringWithFormat:@"%@ %@mAh\n",
             NSLocalizedString(@"BATTERY_MAX_CAPACITY", @""),
             batteryMaxCapacity];
    }
    else {
        batteryMaxCapacity =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BATTERY_MAX_CAPACITY", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    // バッテリーデザイン容量取得
    NSString *batteryDegignCapacity = [status getNoteBatteryDegignCapacity];
    if (![batteryDegignCapacity isEqualToString:@""]) {
        batteryDegignCapacity =
            [NSString stringWithFormat:@"%@ %@mAh\n",
             NSLocalizedString(@"BATTERY_DEGIGN_CAPACITY", @""),
             batteryDegignCapacity];
    }
    else {
        batteryDegignCapacity =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BATTERY_DEGIGN_CAPACITY", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    // BTキーボードのバッテリー残量取得
    NSString *keybordBattery = [status getBTKeyboardBatteryPercent];
    if (![keybordBattery isEqualToString:@""]) {
        keybordBattery =
            [NSString stringWithFormat:@"%@ %@%%\n",
             NSLocalizedString(@"BTKEYBORD_BATTERY", @""),
             keybordBattery];
    }
    else {
        keybordBattery =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BTKEYBORD_BATTERY", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    
    // BTマウスのバッテリー残量取得
    NSString *mouseBattery = [status getBTMouseBatteryPercent];
    if (![mouseBattery isEqualToString:@""]) {
        mouseBattery =
            [NSString stringWithFormat:@"%@ %@%%\n",
             NSLocalizedString(@"BTMOUSE_BATTERY", @""),
             mouseBattery];
    }
    else {
        mouseBattery =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BTMOUSE_BATTERY", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    
    // BTトラックパッドのバッテリー残量取得
    NSString *trackpadBattery = [status getBTTrackpadBatteryPercent];
    if (![trackpadBattery isEqualToString:@""]) {
        trackpadBattery =
            [NSString stringWithFormat:@"%@ %@%%\n",
             NSLocalizedString(@"BTTRACKPAD_BATTERY", @""),
             trackpadBattery];
    }
    else {
        trackpadBattery =
            [NSString stringWithFormat:@"%@ %@\n",
             NSLocalizedString(@"BTTRACKPAD_BATTERY", @""),
             NSLocalizedString(@"NOT_CONNECT", @"")];
    }
    
    // テキストを一気に連結
    displayText =
        [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@",
         externalConnected,
         batteryIsFully,
         batteryTimeLeft,
         batteryPercent,
         batteryHelth,
         batteryCurrentCapacity,
         batteryMaxCapacity,
         batteryDegignCapacity,
         keybordBattery,
         mouseBattery,
         trackpadBattery];
    
    [self performSelectorOnMainThread:@selector(updateDisplayTextView) withObject:nil waitUntilDone:NO];
}

-(void)createBatteryStatusTextDidfinish
{
    [self updateDisplayTextView];
}

-(void)updateDisplayTextView
{
    [textView setBackgroundColor:[NSColor clearColor]];
    [textView setTextColor:[NSColor whiteColor]];
    [textView setString:displayText];
}

@end
