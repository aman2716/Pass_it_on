//
//  EmpLoginViewController.m
//  passiton
//
//  Created by Aman on 2/26/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "EmpLoginViewController.h"
#import "CoreData/CoreData.h"

@interface EmpLoginViewController ()
{
    BOOL isEqual;
}
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *r;
@end

@implementation EmpLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isEqual=NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginWasPressed:(id)sender {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    [request setReturnsDistinctResults:YES];
    self.r = [[self.managedObjectContext executeFetchRequest:request error:nil] mutableCopy];
    //NSLog(@"%@",self.r);
//    NSString *u=[[NSString alloc]init];
//    NSString *p=[[NSString alloc]init];
    isEqual=NO;
    for (int i=0;i<self.r.count;i++)
    {//isEqual=NO;
        // NSLog(@"%@",[info valueForKey:@"key"]);
        NSManagedObject *info =[self.r objectAtIndex:i];
        if([self.empUserName.text isEqualToString:[NSString stringWithFormat:@"%@",[info valueForKey:@"username"]]])
        {
            if([self.empPassword.text isEqualToString:[NSString stringWithFormat:@"%@",[info valueForKey:@"password"]]])
            { NSLog(@"%@ %@ %@ %@",self.empUserName.text,self.empPassword.text,[info valueForKey:@"username"],[info valueForKey:@"password"]);isEqual=YES; break;}
        }
    }
    if(isEqual == YES)
    {
        NSLog(@"SUCCESS!");
        [self.empNotificationlabel setText:@"Congratulation you have logged in!"];
        UIViewController *rs = [self.storyboard instantiateViewControllerWithIdentifier:@"emplogin"];
        
        [self.navigationController pushViewController:rs animated:YES ];
        isEqual=NO;
    }
    else{
        NSLog(@"FAILURE!");
        
        [self.empNotificationlabel setText:@"You username or password was incorrect"];
    }

    
    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
