//
//  MyViewController.h
//  TestForClass
//
//  Created by Edisonthk on 4/13/14.
//  Copyright (c) 2014 Edisonthk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyItem.h"

@interface MyViewController : UIViewController

// public item, MuUiTableViewController can access this item
@property MyItem* item;

@end
