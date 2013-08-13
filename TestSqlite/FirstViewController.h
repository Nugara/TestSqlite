//
//  FirstViewController.h
//  TestSqlite
//
//  Created by giuseppen on 8/12/13.
//  Copyright (c) 2013 giuseppen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBAccess.h"
#import "Utente.h"
#import "FormInsertUtenteViewController.h"

@interface FirstViewController : UIViewController

- (void) createLayout;
- (NSMutableArray*) utentiFromModelUtente;
- (void) updateUtenti;
- (void) goToFormInsert;
@end
