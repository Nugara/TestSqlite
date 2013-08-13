//
//  FormInsertUtenteViewController.h
//  TestSqlite
//
//  Created by giuseppen on 8/12/13.
//  Copyright (c) 2013 giuseppen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBAccess.h"

@interface FormInsertUtenteViewController : UIViewController


@property(strong, nonatomic) UITextField *fieldName;
@property(strong, nonatomic) UITextField *fieldSurname;

- (void) createLayout;
- (BOOL) insert;

@end
