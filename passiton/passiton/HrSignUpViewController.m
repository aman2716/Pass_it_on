//
//  HrSignUpViewController.m
//  passiton
//
//  Created by Aman on 2/26/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "HrSignUpViewController.h"
#import "CoreData/CoreData.h"
@interface HrSignUpViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation HrSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)signUpWasPressed:(id)sender {
    
    NSManagedObject *ent = [NSEntityDescription insertNewObjectForEntityForName:@"Hr" inManagedObjectContext:self.managedObjectContext];
    [ent setValue:self.hrUserName.text forKey:@"username"];
    [ent setValue:self.hrPassword.text forKey:@"username"];
    NSError *error = nil;
    [self.managedObjectContext save:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
