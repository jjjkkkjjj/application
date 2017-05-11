//
//  DetailViewController.h
//  sample
//
//  Created by Junnosuke Kado on 2017/05/03.
//  Copyright (c) 2017 JKadonosuke. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
