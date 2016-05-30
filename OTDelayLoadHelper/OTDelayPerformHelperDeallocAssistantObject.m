//
//  OTDelayLoadHelperDeallocAssistantObject.m
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "OTDelayPerformHelperDeallocAssistantObject.h"

@interface OTDelayPerformHelperDeallocAssistantObject ()
@property (nonatomic, strong) NSDictionary *performedSelectorStrings;
@end

@implementation OTDelayPerformHelperDeallocAssistantObject

- (void)addPerformedSelectorString:(NSString *)performedSelectorString object:(id)anArgument
{
    
}

- (void)dealloc
{
    for (NSString *selectorString in self.performedSelectorStrings)
    {
        SEL selector = NSSelectorFromString(selectorString);
        [NSObject cancelPreviousPerformRequestsWithTarget:self.target selector:selector object:nil];
    }
}

@end
