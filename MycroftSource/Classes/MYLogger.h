//
//  MYLogger.h
//  MycroftTemp
//
//  Created by Abhishek Kharb on 17/08/18.
//  Copyright © 2018 Hike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MYLoggingInfo.h"

@interface MYLogger : NSObject

+ (void)startLoggingWithInfo:(id<MYLoggingInfo>)loggingInfo;

@end
