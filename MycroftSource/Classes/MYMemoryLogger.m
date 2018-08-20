//
//  MYMemoryLogger.m
//  Pods
//
//  Created by Abhishek Kharb on 17/08/18.
//

#import "MYMemoryLogger.h"
#import <CoreGraphics/CoreGraphics.h>
#import <mach/mach.h>

@interface MYMemoryLogger()
@property (nonatomic) dispatch_source_t myTimer;
@property (nonatomic) NSMutableArray *collectedData;
@end

@implementation MYMemoryLogger

- (void)startMemoryLoggingWithInfo:(id <MYLoggingInfo>)info dispatchQueue:(dispatch_queue_t)dispatchQueue {
    NSTimeInterval timePeriod = info.duration;
    NSTimeInterval interval = info.samplingRate;

    __weak typeof(self) weakSelf = self;
    self.myTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatchQueue);
    self.collectedData = [[NSMutableArray alloc] init];
    if (self.myTimer)
    {
        dispatch_source_set_timer(self.myTimer, dispatch_time(DISPATCH_TIME_NOW, 1), interval * 0.0000000001 , 100);
        dispatch_source_set_event_handler(self.myTimer, ^{
            [weakSelf logMemeryStatus];
        });
        dispatch_resume(self.myTimer);
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timePeriod * NSEC_PER_SEC)), dispatchQueue, ^{
        dispatch_source_cancel(weakSelf.myTimer);
        weakSelf.myTimer = nil;
    });
    
}

- (void)logMemeryStatus {
    struct task_basic_info info;
    mach_msg_type_number_t size = TASK_BASIC_INFO_COUNT;
    kern_return_t kernelStatus = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    if(kernelStatus == KERN_SUCCESS) {
        CGFloat memUsage = (CGFloat)info.resident_size / (1024 * 1024);
        [self.collectedData addObject:@(memUsage)];
    } else {
        //ToDo: Log error string "mach_error_string(kernelStatus)"
    }
}

@end
