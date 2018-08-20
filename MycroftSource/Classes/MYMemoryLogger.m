//
//  MYMemoryLogger.m
//  Pods
//
//  Created by Abhishek Kharb on 17/08/18.
//

#import "MYMemoryLogger.h"
#import <CoreGraphics/CoreGraphics.h>
#import <mach/mach.h>

@implementation MYMemoryLogger

+ (void)startMemoryLoggingWithInfo:(id <MYLoggingInfo>)info dispatchQueue:(dispatch_queue_t)dispatchQueue {
    NSTimeInterval timePeriod = info.duration;
    NSTimeInterval interval = info.samplingRate;
    dispatch_async(dispatchQueue, ^{
        //Start logging here.
        NSMutableArray *values = [NSMutableArray new];
        [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(logMemeryStatus:) userInfo:values repeats:YES];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timePeriod * NSEC_PER_SEC)),dispatchQueue, ^{
        //Stop logging here.
    });
}

+ (void)logMemeryStatus:(NSTimer *)timer {
    NSMutableArray *values = timer.userInfo;
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(TASK_BASIC_INFO_COUNT);
    kern_return_t kerr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    if(kerr == KERN_SUCCESS) {
        CGFloat memUsage = (CGFloat)info.resident_size / 1000000);
        NSLog(@"Memory in use (in MB): %f", memUsage;
            
        
    } else {
        NSLog(@"Error with task_info(): %s", mach_error_string(kerr));
    }
}

@end
