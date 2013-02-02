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
-(NSString *)getNoteBatteryPersent;
-(NSString *)getNoteBatteryHelth;
-(NSString *)getNoteBatteryCycle;

/**
 * Bluetoothアクセサリ
 */
-(NSString *)getBTKeyboardBatteryPersent;
-(NSString *)getBTMouseBatteryPersent;
-(NSString *)getBTTrackpadBatteryPersent;

@end
