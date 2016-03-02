//
//  EmpSignUpViewController.m
//  passiton
//
//  Created by Aman on 2/26/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "EmpSignUpViewController.h"
#import "CoreData/CoreData.h"
@interface EmpSignUpViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *r;
@end

@implementation EmpSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
}
- (IBAction)signUpWasPressed:(id)sender {
    int flag=0;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    [request setReturnsDistinctResults:YES];
    self.r = [[self.managedObjectContext executeFetchRequest:request error:nil] mutableCopy];
    for(NSManagedObject *info in self.r)
    {
        if([self.empUserName.text isEqualToString:[NSString stringWithFormat:@"%@",[info valueForKey:@"username"]]])
        {
                [self.empNotificationlabel setText:@"User Already Exist"];
            flag=1;
            break;
        }
    }
    if(flag==0)
    {
    NSManagedObject *ent = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:self.managedObjectContext];
    [ent setValue:self.empUserName.text forKey:@"username"];
    [ent setValue:self.empPassword.text forKey:@"password"];
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    [self.empNotificationlabel setText:@"Congratulation you have Singed Up!"];

//    UIViewController *rs = [self.storyboard instantiateViewControllerWithIdentifier:@"emp"];
//    
//    [self.navigationController pushViewController:rs animated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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

 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
