//
//  ISDelegate.m
//  SupersoniceDemoApp
//
//  Created by Yotam Ohayon on 08/12/2015.
//  Copyright © 2015 supersonic. All rights reserved.
//

#import "ISDelegate.h"

@interface ISDelegate ()
@property (nonatomic, strong) ViewController *viewController;
@end

@implementation ISDelegate

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithViewController:(ViewController *)viewController {
    self = [super init];
    
    if (self) {
        _viewController = viewController;
    }
    
    return self;
}

#pragma mark -
#pragma mark SupersonicISDelegate Functions

// This method gets invoked after a successful initialization of the product.
- (void)supersonicISInitSuccess {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.loadISButton setEnabled:YES];
    });
}

// This method gets invoked after a failed attempt to initialize Interstitial.
// If it does happen, check out 'error' for more information and consult our
// Knowledge center.
- (void)supersonicISInitFailedWithError:(NSError *)error {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)supersonicISReady {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.showISButton setEnabled:YES];
    });
}

- (void)supersonicISFailed {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.showISButton setEnabled:NO];
    });
}

- (void)supersonicISAdOpened {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

// The method will be called each time the Interstitial windows has opened successfully.
- (void)supersonicISShowSuccess {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

// This method gets invoked after a failed attempt to load Interstitial.
// If it does happen, check out 'error' for more information and consult our
// Knowledge center.
- (void)supersonicISShowFailWithError:(NSError *)error {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

// This method lets you know whether or not there is an ad
// ready to be presented. It is only after this method is invoked
// with 'available' set to 'YES' that you should call 'showIS'.
- (void)supersonicISAdAvailable:(BOOL)available {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.viewController.showISButton setEnabled:available];
    });
}

// This method will be called each time the user had clicked the Interstitial ad.
- (void)supersonicISAdClicked {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

// This method get invoked after the Interstitial window had closed and control
// returns to your application.
- (void)supersonicISAdClosed {
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

@end
