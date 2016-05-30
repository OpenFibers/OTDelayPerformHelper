//
//  OTDelayLoadHelperDeallocAssistantObject.h
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTDelayLoadHelperDeallocAssistantObject : NSObject

@property (nonatomic, assign) id target;

- (void)addPerformedSelectorString:(NSString *)performedSelectorString object:(id)anArgument;

@end
