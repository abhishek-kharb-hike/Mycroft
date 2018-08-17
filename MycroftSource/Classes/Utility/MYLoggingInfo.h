//
//  MYLoggingInfo.h
//  MycroftTemp
//
//  Created by Abhishek Kharb on 17/08/18.
//  Copyright © 2018 Hike. All rights reserved.
//

#ifndef MYLoggingInfo_h
#define MYLoggingInfo_h

typedef NS_ENUM(NSInteger, MYLoggingType) {
    MYLoggingTypeMemoryUsage = 0,
    MYLoggingTypeCPUUsage,
    MYLoggingTypeBatteryUsage,
};

@protocol MYLoggingInfo <NSObject>
@property (nonatomic) MYLoggingType loggingType;
@property (nonatomic) NSInteger samplingRate;
@property (nonatomic) NSTimeInterval duration;

@end

#endif /* MYLoggingInfo_h */
