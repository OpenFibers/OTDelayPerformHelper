//
//  OTDelayLoadHelperDeallocAssistantObject.m
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "OTDelayPerformHelperDeallocAssistantObject.h"
#import "OTDelayPerformHelperDeallocAssistantArgumentContainer.h"

@interface OTDelayPerformHelperDeallocAssistantObject ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, OTDelayPerformHelperDeallocAssistantArgumentContainer *> *performedSelectorAndArgumentMap;
@end

@implementation OTDelayPerformHelperDeallocAssistantObject

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.performedSelectorAndArgumentMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addPerformedSelectorString:(NSString *)performedSelectorString object:(id)anArgument
{
    OTDelayPerformHelperDeallocAssistantArgumentContainer *container = [[OTDelayPerformHelperDeallocAssistantArgumentContainer alloc] init];
    container.argument = anArgument;
    self.performedSelectorAndArgumentMap[performedSelectorString] = anArgument;
}

- (void)dealloc
{
    for (NSString *selectorString in self.performedSelectorAndArgumentMap.allKeys)
    {
        SEL selector = NSSelectorFromString(selectorString);
        OTDelayPerformHelperDeallocAssistantArgumentContainer *container = self.performedSelectorAndArgumentMap[selectorString];
        [NSObject cancelPreviousPerformRequestsWithTarget:self.target selector:selector object:container.argument];
    }
}

@end
