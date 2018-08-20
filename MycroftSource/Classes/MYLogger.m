//
//  MYLogger.m
//  MycroftTemp
//
//  Created by Abhishek Kharb on 17/08/18.
//  Copyright © 2018 Hike. All rights reserved.
//

#import "MYLogger.h"
#import "MYMemoryLogger.h"

@interface MYLogger()
@property (nonatomic) MYMemoryLogger *memoryLogger;
@end

@implementation MYLogger

#pragma mark - Utility Methods
- (dispatch_queue_t)loggerQueue {
    static dispatch_queue_t _loggerQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _loggerQueue = dispatch_queue_create("com.mycroft.logger.queue", DISPATCH_QUEUE_SERIAL);
    });
    return _loggerQueue;
}

#pragma mark - Action Methods
- (void)startLoggingWithInfo:(id<MYLoggingInfo>)loggingInfo {
    switch (loggingInfo.loggingType) {
        case MYLoggingTypeMemoryUsage: {
            self.memoryLogger = [[MYMemoryLogger alloc] init];
            [self.memoryLogger startMemoryLoggingWithInfo:loggingInfo dispatchQueue:[self loggerQueue]];
        }
            break;
        case MYLoggingTypeCPUUsage:
            break;
        case MYLoggingTypeBatteryUsage:
            break;
        default:
            break;
    }
}


@end
