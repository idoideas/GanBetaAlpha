//
//  GanGalitLoachModaot.m
//  GanGalit
//
//  Created by iphone-jul on 8/15/13.
//  Copyright (c) 2013 idoideas. All rights reserved.
//

#import "GanGalitLoachModaot.h"

@interface GanGalitLoachModaot ()
@property (strong,nonatomic) IBOutlet UIWebView *webView22;
@property (weak,nonatomic) NSURLRequest *request2;
@property (weak,nonatomic) NSString *site2;
@property (weak,nonatomic) NSURL *google2;
@property (weak, nonatomic) IBOutlet UIToolbar *Toolbar2;
@end

@implementation GanGalitLoachModaot
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (IBAction)close:(UIBarButtonItem *)sender {
        if (!_Toolbar2.hidden)
        [_Toolbar2 setHidden:YES];
    else if (_Toolbar2.hidden)
        [_Toolbar2 setHidden:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        self.navigationController.navigationBarHidden = YES;
    [_webView22 setScalesPageToFit:YES];
    _site2 = @"https://plus.google.com/u/0/117846375751537605523/posts";
    _google2 = [NSURL URLWithString:_site2];
    _request2 = [NSURLRequest requestWithURL:_google2];
    [_webView22 loadRequest: _request2];
    _Toolbar2.hidden = YES;
	// Do any additional setup after loading the view.
}
/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}*/

@end
