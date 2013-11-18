//
//  GanGalitViewController.m
//  GanGalit
//
//  Created by iphone-jul on 8/14/13.
//  Copyright (c) 2013 idoideas. All rights reserved.
//

#import "GanGalitViewController.h"

@interface GanGalitViewController ()
@end

@implementation GanGalitViewController
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        return YES;
    }
    return NO;}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.navigationItem.backBarButtonItem;

    //[self.navigationController setNavigationBarHidden:YES animated:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
