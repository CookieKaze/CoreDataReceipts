//
//  ViewController.h
//  Receipts++
//
//  Created by Erin Luu on 2016-11-24.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tag;

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) NSManagedObjectContext * context;
@property (nonatomic) NSMutableArray * tableData;
@property (nonatomic) NSArray<Tag*> * tagList;
@end

