//
//  GTFrontViewController.h
//  GTAppMenuController
//
//  Created by Gianluca Tursi on 23/05/14.
//  Copyright (c) 2014 Gianluca Tursi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTAppMenuController.h"

@interface GTFrontViewController : UIViewController

@property (strong, nonatomic) GTAppMenuController * navController;
- (IBAction)menuPressed:(id)sender;

@end
