//
//  NSObject+OTDelayLoadHelper.h
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (OTDelayLoadHelper)

/**
 *  Delay call a selector.
 *  If last call of selector not performed, and this method get called again, last call will be automatically canceled.
 *  If self dealloced, last call will be canceled.
 *
 *  @param selector The selector to call.
 *  @param delay    Delay.
 */
- (void)delayCallSelector:(SEL)selector delay:(NSTimeInterval)delay;

@end
