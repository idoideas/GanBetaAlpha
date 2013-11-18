//
//  instantMassageViewController.m
//  GanGalit
//
//  Created by iphone-jul on 8/19/13.
//  Copyright (c) 2013 idoideas. All rights reserved.
//

#import "instantMassageViewController.h"

@interface instantMassageViewController ()
@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell;

@end

@implementation instantMassageViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
        else if (result == MessageComposeResultSent)
            NSLog(@"Message sent");
            else 
                NSLog(@"Message failed");
                }
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray = [NSArray arrayWithObjects:@"הילד לא יגיע היום" ,@"הילד יאחר",@"אאחר לקחת את הילד", nil];
    [_TableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [_TableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cellname = [tableView cellForRowAtIndexPath:indexPath];
    if ([cellname.textLabel.text isEqual:@"הילד לא יגיע היום"])
    {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"בחרת לשלוח הודעת 'הילד לא יגיע היום'" message:@"הפניה לאפליקצית ההודעות תתבצע מיד. אתם יכולים לשלוח את ההודעה כפי שהיא או לערוך אותה לפני כן." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [self sendSMS:@"הילד שלי לא יגיע היום לגן. " recipientList:[NSArray arrayWithObject:@"0509584988"]];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [messageAlert show];
    }
    if ([cellname.textLabel.text isEqual:@"הילד יאחר"])
    {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"בחרת לשלוח הודעת 'הילד יאחר'" message:@"הפניה לאפליקצית ההודעות תתבצע מיד. אתם יכולים לשלוח את ההודעה כפי שהיא או לערוך אותה לפני כן." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [self sendSMS:@"הילד שלי יאחר יאחר היום. " recipientList:[NSArray arrayWithObject:@"0509584988"]];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [messageAlert show];}
    if ([cellname.textLabel.text isEqual:@"אאחר לקחת את הילד"])
    {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"בחרת לשלוח הודעת 'אאחר לקחת את הילד'" message:@"הפניה לאפליקצית ההודעות תתבצע מיד. אתם יכולים לשלוח את ההודעה כפי שהיא או לערוך אותה לפני כן." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [self sendSMS:@"אאחר לקחת את הילד היום. " recipientList:[NSArray arrayWithObject:@"0509584988"]];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [messageAlert show];}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)filterContentForSearchText: (NSString *) searchText
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchText];
    self.searchResults = [self.dataArray filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString];
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        return [self.dataArray count];
    } else { // (tableView == self.searchDisplayController.searchResultsTableView)
        return  [self.searchResults count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (tableView == self.tableView) {
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    }
    return cell;
}



#pragma mark - Table view delegate


@end
