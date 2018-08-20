//
//  MYMemoryLogger.h
//  Pods
//
//  Created by Abhishek Kharb on 17/08/18.
//

#import <Foundation/Foundation.h>
#import "MYLoggingInfo.h"

@interface MYMemoryLogger : NSObject
+ (void)startMemoryLoggingWithInfo:(id <MYLoggingInfo>)info dispatchQueue:(dispatch_queue_t)dispatchQueue;
@end
