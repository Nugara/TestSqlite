//
//  DBAccess.h
//  Catalog
//
//  Created by Patrick Alessi on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// This includes the header for the SQLite library.
#import <sqlite3.h>
#import "Utente.h"

@interface DBAccess : NSObject {
    
    
}

- (NSMutableArray*) getAllUtenti;
- (void) closeDatabase;
- (void)initializeDatabase;

@end

