//
//  MYLogger.m
//  MycroftTemp
//
//  Created by Abhishek Kharb on 17/08/18.
//  Copyright © 2018 Hike. All rights reserved.
//

#import "MYLogger.h"

@implementation MYLogger

+ (void)startLoggingWithInfo:(id<MYLoggingInfo>)loggingInfo {
    switch (loggingInfo.loggingType) {
        case MYLoggingTypeMemoryUsage:
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
