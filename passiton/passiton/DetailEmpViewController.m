//
//  DetailEmpViewController.m
//  passiton
//
//  Created by Aman on 2/26/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "DetailEmpViewController.h"
#import "CoreData/CoreData.h"
#import "CompNctcViewController.h"
#import "Model.h"
#import "sharedDB.h"
@interface DetailEmpViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation DetailEmpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@ %@ %@ %@",self.empname.text,self.empdes.text,self.empdep.text,self.empsal.text);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
- (IBAction)submit:(id)sender {
    
        Model *m=[Model sharedManager];
        m.name=self.empname.text;
        m.designation=self.empdes.text;
        m.department=self.empdep.text;
        m.salary=self.empsal.text;
    
    sharedDB *sdb=[sharedDB sharedManager];
    sdb.managedObjectContext=self.managedObjectContext;
    [sdb saveEmpDetailForName:m.name forDes:m.designation forDep:m.department froSal:m.salary];
    
//        CompNctcViewController *c=[[CompNctcViewController alloc]init];
//        c.sname=self.empname.text;
        UITableViewController *rs = [self.storyboard instantiateViewControllerWithIdentifier:@"formtable"];
        
        [self.navigationController pushViewController:rs animated:YES ];
    
        
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
