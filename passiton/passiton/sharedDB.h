//
//  sharedDB.h
//  passiton
//
//  Created by Aman on 2/27/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"
@interface sharedDB : NSObject
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObject *ent;
+(id)sharedManager;
-(void) saveEmpDetailForName:(NSString *)name forDes:(NSString *)des forDep:(NSString *)dep froSal:(NSString *)sal;
-(void) saveBillForDate:(NSString *)date forVou:(NSString *)vou forBill:(NSString *)bill forComp:(NSString *)comp forDescrip:(NSString *)descrip;

@end
