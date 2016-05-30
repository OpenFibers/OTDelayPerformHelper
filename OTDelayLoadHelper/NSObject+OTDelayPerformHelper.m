//
//  NSObject+OTDelayLoadHelper.m
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "NSObject+OTDelayPerformHelper.h"
#import "OTDelayPerformHelperDeallocAssistantObject.h"

@implementation NSObject (OTDelayPerformHelper)

- (void)autoCanceledPerformSelector:(_Nonnull SEL)selector withObject:(nullable id)anArgument afterDelay:(NSTimeInterval)delay
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:selector object:anArgument];
    [self performSelector:selector withObject:anArgument afterDelay:delay];
    
}

@end
