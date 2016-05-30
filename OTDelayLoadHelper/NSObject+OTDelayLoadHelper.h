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
 *  Delay call a selector with 'auto cancel', that is:
 *  If last call of selector not performed, and this method get called again, last call will be automatically canceled.
 *  If self dealloced, last call will be canceled.
 *  Useful when perform a lazy load action, multi-call in a period will become a single call.
 *
 *  @param selector     The target for requests previously registered with the performSelector:withObject:afterDelay: instance method.
 *  @param anArgument   The argument to pass to the method when it is invoked. Pass nil if the method does not take an argument.
 *  @param delay        The minimum time before which the message is sent. Specifying a delay of 0 does not necessarily cause the selector to be performed immediately. The selector is still queued on the thread’s run loop and performed as soon as possible.
 */
- (void)autoCanceledPerformSelector:(SEL)selector withObject:(nullable id)anArgument afterDelay:(NSTimeInterval)delay;

@end
