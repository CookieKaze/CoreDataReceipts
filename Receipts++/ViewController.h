//
//  ViewController.h
//  Receipts++
//
//  Created by Erin Luu on 2016-11-24.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) NSManagedObjectContext * context;

@end

