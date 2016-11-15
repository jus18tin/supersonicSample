//
//  ViewController.m
//  SupersoniceDemoApp
//
//  Created by Yotam Ohayon on 08/12/2015.
//  Copyright © 2015 supersonic. All rights reserved.
//

#import "ViewController.h"
#import "RVDelegate.h"
#import "OWdelegate.h"
#import "ISDelegate.h"
#import <Supersonic/SUSupersonicAdsConfiguration.h>

#define USERID @"demoapp"
#define APPKEY @"437ae1ad"

@interface ViewController ()

@property (nonatomic, strong) id<SupersonicRVDelegate>  rvDelegate;
@property (nonatomic, strong) id<SupersonicOWDelegate>  owDelegate;
@property (nonatomic, strong) id<SupersonicISDelegate>  isDelegate;
@property (nonatomic, weak) IBOutlet UILabel            *versionLabel;

@end

@implementation ViewController

#pragma mark -
#pragma mark Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UI setup
    self.versionLabel.text = [NSString stringWithFormat:@"sdk version %@",
                              [[Supersonic sharedInstance] getVersion]];
    
    for (UIButton *button in @[self.showISButton, self.showOWButton, self.showRVButton, self.loadISButton]) {
        button.layer.cornerRadius = 17.0f;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = 3.5f;
        button.layer.borderColor = [[UIColor grayColor] CGColor];
    }
    
    [SUSupersonicAdsConfiguration getConfiguration].useClientSideCallbacks = @(YES);
    
    //Supersonic tracking SDK
    [SupersonicEventsReporting reportAppStarted];

    // Before initializing any of our products (Rewarded video, Offerwall or Interstitial) you must set
    // their delegates. Take a look at these classes and you will see that they each implement a product
    // protocol. This is our way of letting you know what's going on, and if you don't set the delegates
    // we will not be able to communicate with you.
    // We're passing 'self' to our delegates because we want
    // to be able to enable/disable buttons to match ad availability.
    self.rvDelegate = [[RVDelegate alloc] initWithViewController:self];
    self.owDelegate = [[OWdelegate alloc] initWithViewController:self];
    self.isDelegate = [[ISDelegate alloc] initWithViewController:self];
    
    [[Supersonic sharedInstance] setRVDelegate:self.rvDelegate];
    [[Supersonic sharedInstance] setOWDelegate:self.owDelegate];
    [[Supersonic sharedInstance] setISDelegate:self.isDelegate];
    
    // After setting the delegates you can go ahead and initialize the products.
    [[Supersonic sharedInstance] initRVWithAppKey:@"596513cd" withUserId:@"justin"];
    [[Supersonic sharedInstance] initOWWithAppKey:@"596513cd" withUserId:@"justin"];
    [[Supersonic sharedInstance] initISWithAppKey:@"596513cd" withUserId:@"justin"];
    
    // Scroll down the file to find out what happens when you click a button...
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)showRVButtonTapped:(id)sender {
    
    // After calling 'setRVDelegate' and 'initRVWithAppKey:withUserId'
    // you are ready to present an ad. You can supply a placement
    // by calling 'showRVWithPlacementName', or you can simply
    // call 'showRV'. In this case the SDK will use the default
    // placement one created for you.
    [[Supersonic sharedInstance] showRV];
    
}

- (IBAction)showOWButtonTapped:(id)sender {
    
    // This will present the Offerwall. Unlike Rewarded
    // Videos there are no placements.
    [[Supersonic sharedInstance] showOW];
    
}

- (IBAction)showISButtonTapped:(id)sender {
    
    // This will present the Interstitial. Unlike Rewarded
    // Videos there are no placements.
    [[Supersonic sharedInstance] showISWithViewController:self];
    
}

- (IBAction)loadISButtonTapped:(id)sender {
    
    // This will load the Interstitial. Unlike Rewarded
    // Videos there are no placements.
    [[Supersonic sharedInstance] loadIS];
    
}


@end
