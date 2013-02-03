//
//  GetBatteryStatus.m
//  BatteryStatus
//

#import "BatteryStatus.h"

@implementation BatteryStatus

/**
 * ノートブックバッテリー
 */
-(BOOL)getNoteBatteryExternalConnect
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -w0 -l | grep ExternalConnected | awk '{print $5}'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSLog(@"External Connect: %@", result);
    
    if ([result isEqualToString:@"Yes"]) {
        return true;
    }
    return false;
}

-(BOOL)getNoteBatteryIsFully
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -n AppleSmartBattery | grep FullyCharged | awk '{ print $5 }'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSLog(@"Battery Is Fully: %@", result);
    
    if ([result isEqualToString:@"Yes"]) {
        return true;
    }
    return false;
} 

-(NSString *)getNoteBatteryTimeLeft 
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -n AppleSmartBattery | grep TimeRemaining | awk '{ print $5 }'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSLog(@"Battery Time Left: %@", result);
    
    return result;
}

-(NSString *)getNoteBatteryDegignCapacity 
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -w0 -l | grep DesignCapacity | awk '{print $5}'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSLog(@"Design Capacity: %@", result);
    
    return result;
}

-(NSString *)getNoteBatteryMaxCapacity 
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -w0 -l | grep MaxCapacity | awk '{print $5}'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSLog(@"Max Capacity: %@", result);
    
    return result;

}

-(NSString *)getNoteBatteryCurrentCapacity 
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -w0 -l | grep CurrentCapacity | awk '{print $5}'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSLog(@"Current Capacity: %@", result);
    
    return result;
}

-(NSString *)getNoteBatteryPersent 
{
    NSString *current = [self getNoteBatteryCurrentCapacity];
    NSString *max = [self getNoteBatteryMaxCapacity];
    
    int charge = [current intValue] * 100 / [max intValue];
    NSString *result = [NSString stringWithFormat:@"%d", charge];
    
    NSLog(@"Charge: %@", result);
    
    return result;
}

-(NSString *)getNoteBatteryHelth 
{
    NSString *design = [self getNoteBatteryDegignCapacity];
    NSString *max = [self getNoteBatteryMaxCapacity];
    
    int helth = [max intValue] * 100 / [design intValue];
    NSString *result = [NSString stringWithFormat:@"%d", helth];
    
    NSLog(@"Helth: %@", result);
    
    return result;
}

-(NSString *)getNoteBatteryCycle 
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -w0 -l | grep \"Cycle Count\" | awk 'BEGIN { FS = \"=\" } ; {print $8}' | awk 'BEGIN { FS = \"}\" } ; {print $1}'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSLog(@"Cycle Count: %@", result);
    
    return result;
}

/**
 * Bluetoothアクセサリ系
 */

-(NSString *)getBTKeyboardBatteryPersent 
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -c AppleBluetoothHIDKeyboard | grep BatteryPercent | tail -1|awk '{print $NF}'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //result = [result stringByAppendingString:@"%"];
    
    NSLog(@"Wireless Keyboard: %@", result);
    
    return result;
}

-(NSString *)getBTMouseBatteryPersent 
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -c BNBMouseDevice | grep BatteryPercent | tail -1|awk '{print $NF}'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //result = [result stringByAppendingString:@"%"];
    
    NSLog(@"Mouse Battery: %@", result);
    
    return result;
}

-(NSString *)getBTTrackpadBatteryPersent 
{
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"ioreg -c BNBTrackpadDevice | grep BatteryPercent | tail -1|awk '{print $NF}'", nil]];
    
    [task setStandardOutput: pipe];
    [task launch];
    
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle readDataToEndOfFile];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //result = [result stringByAppendingString:@"%"];
    
    NSLog(@"Trackpad Battery: %@", result);
    
    return result;
}

@end
