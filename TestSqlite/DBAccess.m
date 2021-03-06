//
//  DBAccess.m
//  Catalog
//
//  Created by Patrick Alessi on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBAccess.h"

@implementation DBAccess

// Reference to the SQLite database.
sqlite3* database;
static NSString *nameDB = @"testgiu.db";

-(id) init
{
    //  Call super init to invoke superclass initiation code
    if ((self = [super init]))
    {
        //  set the reference to the database
        [self initializeDatabase];
    }
    return self;
}

- (NSString *) pathDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (void) checkDatabase
{
    NSString *pathDocument = [self pathDocumentsDirectory];
    NSString *pathDB = [pathDocument stringByAppendingPathComponent:nameDB];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if([manager fileExistsAtPath:pathDB])
    {
        NSLog(@"EXIST");
    }
    else
    {
        NSString *path = [[NSBundle mainBundle]
                          pathForResource:@"testgiu"
                          ofType:@"db"];
        
        [manager copyItemAtPath:path toPath:pathDB error:nil];
    }
}

// Open the database connection
- (void)initializeDatabase {
    
    // Get the database from the application bundle.
    
    
    [self checkDatabase];
    
    NSString *pathDocument = [self pathDocumentsDirectory];
    NSString *pathDB = [pathDocument stringByAppendingPathComponent:nameDB];
    
    // Open the database.
    if (sqlite3_open([pathDB UTF8String], &database) == SQLITE_OK)
    {
        NSLog(@"Opening Database");
    }
    else
    {
        // Call close to properly clean up
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database: ‘%s’.",
                  sqlite3_errmsg(database));
    }
}


-(void) closeDatabase
{
    // Close the database.
    if (sqlite3_close(database) != SQLITE_OK) {
        NSAssert1(0, @"Error: failed to close database: ‘%s’.",
                  sqlite3_errmsg(database));
    }
}

- (BOOL) insertUtenteWidthName : (NSString*) name widthSurname : (NSString*) surname
{
    const char *sql = "INSERT INTO utente (nome, cognome) values (?,?)";
    
    sqlite3_stmt *statement;
    
    int sqlResult = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
    
    if( sqlResult == SQLITE_OK ) {
        // bind the value
        sqlite3_bind_text(statement, 2, [surname UTF8String], strlen([surname UTF8String]), 0);
        sqlite3_bind_text(statement, 1, [name UTF8String], strlen([name UTF8String]), 0);
        
        // commit
        sqlite3_step(statement);
        sqlite3_finalize(statement);
        
        return true;
    }
    
    return false;
    
}

- (BOOL) updateNameUtente : (NSString*) name widthID : (int) IDUtente
{
    const char *sql = "UPDATE utente set nome = ? where id = ?";
    
    sqlite3_stmt *statement;
    
    int sqlResult = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
    
    if( sqlResult == SQLITE_OK ) {
        // bind the value
        sqlite3_bind_int(statement, 2, IDUtente);
        sqlite3_bind_text(statement, 1, [name UTF8String], strlen([name UTF8String]), 0);
        
        // commit
        sqlite3_step(statement);
        sqlite3_finalize(statement);
        
        return true;
    }

    return false;
}

- (NSMutableArray*) getAllUtenti
{
    //  The array of products that we will create
    NSMutableArray *utenti = [[NSMutableArray alloc] init];

    //  The SQL statement that we plan on executing against the database
    const char *sql = "SELECT utente.id,utente.nome, \
    utente.cognome FROM utente";

    //  The SQLite statement object that will hold our result set
    sqlite3_stmt *statement;
    
    // Prepare the statement to compile the SQL query into byte-code
    int sqlResult = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);

    if ( sqlResult== SQLITE_OK) {
        // Step through the results - once for each row.
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //  allocate a Product object to add to products array
            Utente  *utente = [[Utente alloc] init];
            // The second parameter is the column index (0 based) in
            // the result set.
            char *name = (char *)sqlite3_column_text(statement, 1);
            char *surname = (char *)sqlite3_column_text(statement, 2);
            
            
            //  Set all the attributes of the product
            utente.idUtente = sqlite3_column_int(statement, 0);
            utente.name = (name) ? [NSString stringWithUTF8String:name] : @"";
            utente.surname = (surname) ? [NSString stringWithUTF8String:surname] : @"";
          
            /*product.details = (details) ? [NSString stringWithUTF8String:details] : @"";
            product.price = sqlite3_column_double(statement, 4);
            product.quantity = sqlite3_column_int(statement, 5);
            product.countryOfOrigin = (countryOfOrigin) ? [NSString
                                                           stringWithUTF8String:countryOfOrigin] : @"";
            product.image = (image) ? [NSString stringWithUTF8String:image] : @"";
           */ 
            // Add the product to the products array
            [utenti addObject:utente];
 
        }
        // finalize the statement to release its resources
        sqlite3_finalize(statement);
    }
    else {
        NSLog(@"Problem with the database:");
        NSLog(@"%d",sqlResult);
    }
    
    return utenti;
    
}
@end
