//
//  MasterViewController.h
//  sample
//
//  Created by Junnosuke Kado on 2017/05/03.
//  Copyright (c) 2017 JKadonosuke. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end
