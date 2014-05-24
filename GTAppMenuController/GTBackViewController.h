//
//  GTBackViewController.h
//  GTAppMenuController
//
//  Created by Gianluca Tursi on 23/05/14.
//  Copyright (c) 2014 Gianluca Tursi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GTBackViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) IBOutlet UITableView *table;
- (IBAction)push:(id)sender;
@property (strong, nonatomic) UIWindow *frontWindow;

@end
