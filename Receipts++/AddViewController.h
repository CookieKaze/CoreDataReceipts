//
//  AddViewController.h
//  Receipts++
//
//  Created by Erin Luu on 2016-11-24.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tag;
@interface AddViewController : UIViewController
@property (nonatomic, weak) NSManagedObjectContext * context;
@end
