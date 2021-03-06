//
//  MyUiTableTableViewController.m
//  TestForClass
//
//  Created by Edisonthk on 4/13/14.
//  Copyright (c) 2014 Edisonthk. All rights reserved.
//

#import "MyUiTableTableViewController.h"
#import "MyViewController.h"
#import "MyItem.h"

@interface MyUiTableTableViewController ()

@property NSMutableArray *data;

@end

@implementation MyUiTableTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc]init];
    
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.data count];
}

// custom method, bind it to segues in storyboard
-(IBAction)unwindToList:(UIStoryboardSegue *)segues
{
    NSLog(@"unwind to list");
    
    // same as "getIntent().getData() returned bundle" in android
    // get the public data from MyViewController.h
    MyViewController* source = [segues sourceViewController];
    MyItem *item = source.item;
    if(item != nil){
        [self.data addObject:item];
        
        // reload tableView
        // same as notifyDataSetChanged in android
        [self.tableView reloadData];
    }
}

-(void)loadInitialData
{
    MyItem* item1 = [[MyItem alloc]init];
    item1.itemName = @"first";
    [self.data addObject:item1];
    
    
    MyItem* item2 = [[MyItem alloc]init];
    item2.itemName = @"second";
    [self.data addObject:item2];
    
    
    MyItem* item3 = [[MyItem alloc]init];
    item3.itemName = @"third";
    [self.data addObject:item3];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentified = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentified forIndexPath:indexPath];
    
    MyItem* item = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = item.itemName;
    
    // create item to row
    if(item.completed){
        // create checkmark to row
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        // remove all item including checkmark in row
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate
// invoked when cells pressed
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"Row selected at %i", indexPath.row);
    
    MyItem* item = [self.data objectAtIndex:indexPath.row];
    
    // toggle item completed
    item.completed = !item.completed;
    
    // tell the table view to reload the row updated
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
