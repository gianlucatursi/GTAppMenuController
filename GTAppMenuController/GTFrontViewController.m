//
//  GTFrontViewController.m
//  GTAppMenuController
//
//  Created by Gianluca Tursi on 23/05/14.
//  Copyright (c) 2014 Gianluca Tursi. All rights reserved.
//

#import "GTFrontViewController.h"

@interface GTFrontViewController ()

@end

@implementation GTFrontViewController
@synthesize navController = _navController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    _navController = (GTAppMenuController *)self.navigationController;
    [_navController setNavigationBarHidden:YES];
    [_navController activateSwipeToOpenMenu:NO];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuPressed:(id)sender {
    
    [_navController openAndCloseMenu];
    
}
@end
