//
//  NSObject+OTDelayLoadHelper.m
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "NSObject+OTDelayPerformHelper.h"
#import <objc/runtime.h>

static void *DeallocAssistantObjectKey = &DeallocAssistantObjectKey;

@interface OTDelayPerformHelperDeallocAssistantObject : NSObject
@property (nonatomic, assign) id target;
@end

@implementation OTDelayPerformHelperDeallocAssistantObject
- (void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self.target];
    self.target = nil;
}
@end


@implementation NSObject (OTDelayPerformHelper)

- (void)autoCanceledPerformSelector:(_Nonnull SEL)selector withObject:(nullable id)anArgument afterDelay:(NSTimeInterval)delay
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:selector object:anArgument];
    [self performSelector:selector withObject:anArgument afterDelay:delay];
    OTDelayPerformHelperDeallocAssistantObject *object = objc_getAssociatedObject(self, DeallocAssistantObjectKey);
    if (!object)
    {
        object = [[OTDelayPerformHelperDeallocAssistantObject alloc] init];
        object.target = self;
        objc_setAssociatedObject(self, DeallocAssistantObjectKey, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
