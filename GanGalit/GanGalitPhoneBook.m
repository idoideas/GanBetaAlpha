//
//  GanGalitPhoneBook.m
//  GanGalit
//
//  Created by iphone-jul on 8/18/13.
//  Copyright (c) 2013 idoideas. All rights reserved.
//

#import "GanGalitPhoneBook.h"
@interface GanGalitPhoneBook () <UISearchDisplayDelegate>
@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSArray *searchResults;
@end

@implementation GanGalitPhoneBook

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cellname = [tableView cellForRowAtIndexPath:indexPath];
    if ([cellname.textLabel.text isEqual:@"עידו שייביץ"])
    {
    UIAlertView *messageAlert = [[UIAlertView alloc]
        initWithTitle:@"בחרת בטלפון של עידו שייביץ" message:@"הפניית שיחה מתבצעת." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:0504584988"]];
    
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [messageAlert show];
    }
    if ([cellname.textLabel.text isEqual:@"הטלפון המרכזי של הגן"])
    {
        UIAlertView *messageAlert = [[UIAlertView alloc]
            initWithTitle:@"בחרת בטלפון המרכזי של הגן" message:@"הפניית שיחה מתבצעת." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:099584988"]];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [messageAlert show];}
    if ([cellname.textLabel.text isEqual:@"הגננת (גלית שייביץ)"])
    {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"בחרת בטלפון של הגננת - גלית שייביץ" message:@"הפניית שיחה מתבצעת." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:099584988"]];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [messageAlert show];}
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray = [NSArray arrayWithObjects:@"עידו שייביץ" ,@"הטלפון המרכזי של הגן",@"הגננת (גלית שייביץ)", nil];
[_TableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
   [_TableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
