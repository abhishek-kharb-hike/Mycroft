//
//  MYLogger.h
//  MycroftTemp
//
//  Created by Abhishek Kharb on 17/08/18.
//  Copyright © 2018 Hike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MYLoggingInfo.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 * @interface MYLogger
 * @discussion The MYLogger class defines the interface to log various performance events
 *
 *
 */
@interface MYLogger : NSObject

/*!
 @brief Starts logging of events.
 
 @discussion This method takes a protocol object for information regarding the logging needed.
 
 @param  loggingInfo All information about the logging, including logginng type, sampling, duration etc.
 
 */
+ (void)startLoggingWithInfo:(id<MYLoggingInfo>)loggingInfo;

@end
NS_ASSUME_NONNULL_END
