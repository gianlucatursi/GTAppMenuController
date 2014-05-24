//
//  GTBackViewController.m
//  GTAppMenuController
//
//  Created by Gianluca Tursi on 23/05/14.
//  Copyright (c) 2014 Gianluca Tursi. All rights reserved.
//

#import "GTBackViewController.h"
#import "GTFrontViewController.h"

@interface GTBackViewController ()

@end

@implementation GTBackViewController{

    NSArray *list;
}

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
    _table.delegate = self;
    _table.dataSource = self;
    
    list = @[@"Gianluca Tursi",@"Home",@"Camera",@"Rures",@"Games",@"Settings"];
    [self.table reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 100;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    [view setBackgroundColor:[UIColor clearColor]];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 50)];
    
    lbl.text = @"Powered by Gianluca Tursi";
    [lbl setFont:[UIFont systemFontOfSize:10]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setTextColor:[UIColor whiteColor]];
    
    [view addSubview:lbl];
    
    return view;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return list.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *img = (UIImageView*)[cell viewWithTag:10];
    
    if(indexPath.row == 0){
        [img setImage:[UIImage imageNamed:@"profile.jpg"]];
    }else{
        [img setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d", indexPath.row]]];
    }
    
    UILabel *lbl = (UILabel *)[cell viewWithTag:11];
    lbl.text = [list objectAtIndex:indexPath.row];
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
    
}

- (IBAction)push:(id)sender {

}
@end
