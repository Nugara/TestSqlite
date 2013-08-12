//
//  FirstViewController.m
//  TestSqlite
//
//  Created by giuseppen on 8/12/13.
//  Copyright (c) 2013 giuseppen. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)createLayout
{
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    label.text = @"test";
    [self.view addSubview:label];
    
    UIButton *selectUtenti = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    selectUtenti.frame = CGRectMake(100, 200, 100, 50);
    [selectUtenti setTitle:@"Utenti" forState:UIControlStateNormal]  ;
    [selectUtenti addTarget:self action:@selector(utentiFromModelUtente) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectUtenti];
    
}

- (NSMutableArray*) utentiFromModelUtente
{
    NSLog(@"%s", __FUNCTION__);
    
    DBAccess *dbAccess = [[DBAccess alloc]init];
    
    NSMutableArray *utenti = [dbAccess getAllUtenti];
    
    for(int i=0; i<[utenti count];i++)
    {
        Utente *temp = utenti[i];
        NSLog(@"id == %i", temp.idUtente);
        NSLog(@"nome == %@", temp.name);
        NSLog(@"cognome == %@\n", temp.surname);
        NSLog(@" ");
    }
    
    
    
    return utenti;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
