//
//  OTDelayLoadHelperDeallocAssistantObject.m
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "OTDelayLoadHelperDeallocAssistantObject.h"

@interface OTDelayLoadHelperDeallocAssistantObject ()
@property (nonatomic, strong) NSDictionary *performedSelectorStrings;
@end

@implementation OTDelayLoadHelperDeallocAssistantObject

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
