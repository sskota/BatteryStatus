//
//  GetBatteryStatus.h
//  BatteryStatus
//

#import <Foundation/Foundation.h>

@interface BatteryStatus : NSObject

/**
 * ノートブックバッテリー
 */
-(BOOL)getNoteBatteryExternalConnect;
-(BOOL)getNoteBatteryIsFully;
-(NSString *)getNoteBatteryTimeLeft;
-(NSString *)getNoteBatteryDegignCapacity;
-(NSString *)getNoteBatteryMaxCapacity;
-(NSString *)getNoteBatteryCurrentCapacity;
-(NSString *)getNoteBatteryPercent;
-(NSString *)getNoteBatteryHelth;
-(NSString *)getNoteBatteryCycle;

/**
 * Bluetoothアクセサリ
 */
-(NSString *)getBTKeyboardBatteryPercent;
-(NSString *)getBTMouseBatteryPercent;
-(NSString *)getBTTrackpadBatteryPercent;

@end
