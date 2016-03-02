//
//  FinViewController.m
//  passiton
//
//  Created by Aman on 2/27/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "FinViewController.h"
#import "CoreData/Coredata.h"
@interface FinViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *fetch;
@end

@implementation FinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text=self.str;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Form"];
    [request setReturnsDistinctResults:YES];
    self.fetch = [[self.managedObjectContext executeFetchRequest:request error:nil] mutableCopy];
    for(NSManagedObject *info in self.fetch)
    {
        if([self.str isEqualToString:[NSString stringWithFormat:@"%@",[info valueForKey:@"name"] ]])
        {
            [ self.lname setText:[info valueForKey:@"name"]];
            self.ldes.text=[NSString stringWithFormat:@"%@",[info valueForKey:@"des"]] ;
            self.ldep.text=[NSString stringWithFormat:@"%@",[info valueForKey:@"dep"]];
            self.lsal.text=[NSString stringWithFormat:@"%@",[info valueForKey:@"sal"]];
            self.lvou.text=[NSString stringWithFormat:@"%@",[info valueForKey:@"voucher"]];
            self.lamt.text=[NSString stringWithFormat:@"%@",[info valueForKey:@"bill"]];
            self.ldate.text=[NSString stringWithFormat:@"%@",[info valueForKey:@"date"]];
            self.label.text=[NSString stringWithFormat:@"%@",[info valueForKey:@"descrip"]];
            
            
        }
    }
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)approve:(id)sender {
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Done"
                                                          message:@"Reimbursement Approved"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles: nil];
    
    [myAlertView show];
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
