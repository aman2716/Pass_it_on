//
//  sharedDB.m
//  passiton
//
//  Created by Aman on 2/27/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "sharedDB.h"
#import "CoreData/CoreData.h"


@implementation sharedDB
+(id)sharedManager {
    static sharedDB *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
       // sharedMyManager.ent = [NSEntityDescription insertNewObjectForEntityForName:@"Form" inManagedObjectContext:sharedMyManager.managedObjectContext];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {

    }
    return self;
}
-(void) saveEmpDetailForName:(NSString *)name forDes:(NSString *)des forDep:(NSString *)dep froSal:(NSString *)sal
{
    self.ent = [NSEntityDescription insertNewObjectForEntityForName:@"Form" inManagedObjectContext:self.managedObjectContext];

    [self.ent setValue:name forKey:@"name"];
    [self.ent setValue:des forKey:@"des"];
    [self.ent setValue:dep forKey:@"dep"];
    [self.ent setValue:sal forKey:@"sal"];
    NSError *error = nil;
    [self.managedObjectContext save:&error];
}
-(void) saveBillForDate:(NSData *)date forVou:(NSString *)vou forBill:(NSString *)bill forComp:(NSString *)comp forDescrip:(NSString *)descrip
{
    self.ent = [NSEntityDescription insertNewObjectForEntityForName:@"Form" inManagedObjectContext:self.managedObjectContext];

    [self.ent setValue:date forKey:@"date"];
    [self.ent setValue:vou forKey:@"voucher"];
    [self.ent setValue:bill forKey:@"bill"];
    [self.ent setValue:comp forKey:@"comp"];
    [self.ent setValue:descrip forKey:@"descrip"];
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    
}
@end
