//
//  ViewController.m
//  OTDelayLoadHelperDemo
//
//  Created by openthread on 5/30/16.
//  Copyright © 2016 openthread. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+OTDelayPerformHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"1";
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloced %@", self.title);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButton setTitle:@"Test push" forState:UIControlStateNormal];
    [testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(pushNewController) forControlEvents:UIControlEventTouchUpInside];
    testButton.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:testButton];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self autoCanceledPerformSelector:@selector(delayCalledMethod) withObject:nil afterDelay:3];
}

- (void)pushNewController
{
    ViewController *controller = [[ViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%zd", self.navigationController.viewControllers.count + 1];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)delayCalledMethod
{
    NSLog(@"delayed called: %@", self.title);
}

@end
