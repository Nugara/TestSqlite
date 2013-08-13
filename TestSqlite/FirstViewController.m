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
    //UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:@selector(goToFormInsert)];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:@"Go insert" style:UIBarButtonItemStyleBordered target:self action:@selector(goToFormInsert)];
  //  item.title = @"Go insert";
   
    self.navigationItem.rightBarButtonItem = item;
    
    CGRect frame = CGRectMake(100, 100, 200, 50);
    
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
  //  label.text = @"test";
  label.text = NSLocalizedString(@"test", nil);
    [self.view addSubview:label];
    
    frame.origin.y += 100;
    
    UIButton *selectUtenti = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    selectUtenti.frame = frame;
    [selectUtenti setTitle:@"Utenti" forState:UIControlStateNormal];
    [selectUtenti addTarget:self action:@selector(utentiFromModelUtente) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectUtenti];
    
    frame.origin.y += 100;
    UIButton *updateUtenti = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    updateUtenti.frame = frame;
    [updateUtenti setTitle:@"Update" forState:UIControlStateNormal];
    [updateUtenti addTarget:self action:@selector(updateUtenti) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:updateUtenti];
}

- (void) goToFormInsert
{
    NSLog(@"%s", __FUNCTION__);
    
    FormInsertUtenteViewController *formInsert = [[FormInsertUtenteViewController alloc]init];
    [self.navigationController pushViewController:formInsert animated:true];
}

-(void) updateUtenti
{
    NSLog(@"%s", __FUNCTION__);
    
    DBAccess *dbAccess = [[DBAccess alloc]init];
    
    if([dbAccess updateNameUtente:@"pippo" widthID:1])
    {
        NSLog(@"UPDATE OK");
    }
    else
    {
        NSLog(@"UPDATE ERROR");
    }
    
    [dbAccess closeDatabase];
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
    
    [dbAccess closeDatabase];
    
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
