//
//  FormInsertUtenteViewController.m
//  TestSqlite
//
//  Created by giuseppen on 8/12/13.
//  Copyright (c) 2013 giuseppen. All rights reserved.
//

#import "FormInsertUtenteViewController.h"

@interface FormInsertUtenteViewController ()

@end

@implementation FormInsertUtenteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) createLayout
{
    self.view.backgroundColor = [UIColor grayColor];
    
    CGRect rectFrame = CGRectMake(100, 100, 200, 50);
    
    self.fieldName = [[UITextField alloc]initWithFrame:rectFrame];
    [self.fieldName setBorderStyle:UITextBorderStyleRoundedRect];
    [self.fieldName setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.view addSubview:self.fieldName];
    
    rectFrame.origin.y += 150;
    self.fieldSurname = [[UITextField alloc]initWithFrame:rectFrame];
    [self.fieldSurname setBorderStyle:UITextBorderStyleRoundedRect];
    [self.fieldSurname setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.view addSubview:self.fieldSurname];
    
    rectFrame.origin.y += 200;
    UIButton *insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    insertButton.frame = rectFrame;
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [insertButton addTarget:self action:@selector(insert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:insertButton];
}

- (BOOL) insert
{
    NSLog(@"%s", __FUNCTION__);
    
    if([self.fieldName.text length]>0 && [self.fieldSurname.text length] > 0)
    {        
        DBAccess *dbAccess = [[DBAccess alloc]init];
    
        [dbAccess insertUtenteWidthName:self.fieldName.text widthSurname:self.fieldSurname.text];
        [dbAccess closeDatabase];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Attenzione" message:@"Inserisci tutti i campi" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
            
    return false;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self createLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
