//
//  Utente.h
//  TestSqlite
//
//  Created by giuseppen on 8/12/13.
//  Copyright (c) 2013 giuseppen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utente : NSObject

@property int idUtente;
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *surname;

@end
