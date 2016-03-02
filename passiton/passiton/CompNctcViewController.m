//
//  CompNctcViewController.m
//  passiton
//
//  Created by Aman on 2/27/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "CompNctcViewController.h"
#import "addnctcViewController.h"
#import "Model.h"
@interface CompNctcViewController ()

@end

@implementation CompNctcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //addnctcViewController *a=[[addnctcViewController alloc]init];
    //DetailEmpViewController *d=[[DetailEmpViewController alloc]init];
    Model *m=[Model sharedManager];
    //NSLog(@"%@ %@ %@ %@",m.name,m.designation,m.department,m.salary);
    //self.lname.text=[[Model sharedManager] name];
    self.lname.text=m.name;
    self.ldes.text=m.designation;
    self.ldep.text=m.department;
    self.lsal.text=m.salary;
    self.lvou.text=m.voucher;
    self.lamt.text=m.bill;
    self.ldate.text=m.date;
    self.label.text=[NSString stringWithFormat:@"%@ Bill Form",self.str];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
