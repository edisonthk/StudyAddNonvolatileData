//
//  MyViewController.m
//  TestForClass
//
//  Created by Edisonthk on 4/13/14.
//  Copyright (c) 2014 Edisonthk. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

// private item, MuUiTableViewController unable to access this item if putting here.
// to make it public, place it in MyViewController.h
//@property MyItem* item;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation MyViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if(sender != self.doneButton) return;
    if(self.textField.text.length > 0){
        self.item = [[MyItem alloc]init];
        self.item.itemName = self.textField.text;
        self.item.completed = NO;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
