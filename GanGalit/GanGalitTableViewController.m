//
//  GanGalitTableViewController.m
//  GanGalit
//
//  Created by iphone-jul on 8/14/13.
//  Copyright (c) 2013 idoideas. All rights reserved.
//

#import "GanGalitTableViewController.h"

@interface GanGalitTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong,nonatomic) IBOutlet UIWebView *webView2;
@property (weak,nonatomic) NSURLRequest *request;
@property (weak, nonatomic) IBOutlet UIToolbar *Toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *close;
@property (weak,nonatomic) NSString *site;
@property (weak,nonatomic) NSString *urlS;
@property (weak,nonatomic) NSURL *google;

@end

@implementation GanGalitTableViewController

- (IBAction)close:(UIBarButtonItem *)sender {
    
    if (!_Toolbar.hidden)
    [_Toolbar setHidden:YES];
    else if (_Toolbar.hidden)
        [_Toolbar setHidden:NO];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [_webView2 setScalesPageToFit:YES];
    _site = @"https://plus.google.com/app/basic/117846375751537605523/photos?cbp=vlh1uncrulwk&sview=25&spath=/app/basic/117846375751537605523";
    _google = [NSURL URLWithString:_site];
    _request = [NSURLRequest requestWithURL:_google];
    [_webView2 loadRequest: _request];
     _Toolbar.hidden = YES;
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}
/*


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
/*
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
//}


- (IBAction)ClosingToobar:(id)sender {
}

@end
