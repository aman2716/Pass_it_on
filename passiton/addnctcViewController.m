//
//  addnctcViewController.m
//  passiton
//
//  Created by Aman on 2/26/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "addnctcViewController.h"
#import "CompNctcViewController.h"
#import "Model.h"
#import "sharedDB.h"
@interface addnctcViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation addnctcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.datePick.hidden=YES;
    self.ltitle.text=[NSString stringWithFormat:@"%@ Bill Form",self.take];
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    
    [self.ldate setInputView:datePicker];
//    Model *m=[Model sharedManager];
//    m.date=[NSString stringWithFormat:@"%@",self.ldate.text];
//    NSLog(@"%@",[NSString stringWithFormat:@"%@",self.ldate.text]);

    // Do any additional setup after loading the view.
}

-(void)updateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.ldate.inputView;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *formatedDate = [dateFormatter stringFromDate:picker.date];
    self.ldate.text = [NSString stringWithFormat:@"%@",formatedDate];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)camera:(id)sender {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    } else {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
        
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
Model *m=[Model sharedManager];
//    sharedDB *sdb=[sharedDB sharedManager];
//    sdb.managedObjectContext=self.managedObjectContext;
//    [sdb saveBillForDate:self.ldate.text forVou:self.lvoucher.text forBill:self.llbill.text forComp:@"Non-CTC" forDescrip:self.take];
    
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:[NSEntityDescription entityForName:@"Form" inManagedObjectContext:self.managedObjectContext]];
    
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    for(NSManagedObject *info in results)
    {
        if([m.name isEqualToString:[NSString stringWithFormat:@"%@",[info valueForKey:@"name"]]])
        {
            [info setValue:self.ldate.text forKey:@"date"];
            [info setValue:self.lvoucher.text forKey:@"voucher"];
            [info setValue:self.llbill.text forKey:@"bill"];
            [info setValue:@"CTC" forKey:@"comp"];
            [info setValue:self.take forKey:@"descrip"];
            [info setValue:@"NO" forKey:@"key"];
            NSError *error = nil;
            [self.managedObjectContext save:&error];
        }
    }

    
    CompNctcViewController *c=segue.destinationViewController;
    c.str=self.take;
    
    
    m.date=[NSString stringWithFormat:@"%@",self.ldate.text];
    m.voucher=self.lvoucher.text;
    m.bill=self.llbill.text;
}


@end
