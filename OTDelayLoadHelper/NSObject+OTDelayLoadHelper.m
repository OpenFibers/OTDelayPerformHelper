//
//  NSObject+OTDelayLoadHelper.m
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "NSObject+OTDelayLoadHelper.h"
#import "OTDelayLoadHelperDeallocAssistantObject.h"

@implementation NSObject (OTDelayLoadHelper)

- (void)autoCanceledPerformSelector:(SEL)selector withObject:(nullable id)anArgument afterDelay:(NSTimeInterval)delay
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:selector object:anArgument];
    [self performSelector:selector withObject:anArgument afterDelay:delay];
    
}

@end
