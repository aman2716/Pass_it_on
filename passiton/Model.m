//
//  Model.m
//  passiton
//
//  Created by Aman on 2/27/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import "Model.h"

@implementation Model
+(Model *)sharedManager {
    static Model *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.name = [[NSString alloc]init];
        sharedMyManager.designation=[[NSString alloc]init];
        sharedMyManager.department=[[NSString alloc]init];
        sharedMyManager.date=[[NSString alloc]init];
        sharedMyManager.voucher=[[NSString alloc]init];
        sharedMyManager.bill=[[NSString alloc]init];
    });
    
        return sharedMyManager;
    
    
}

- (id)init {
    if (self = [super init]) {
//        self.name=[[NSString alloc]init];
//        self.designation=[[NSString alloc]init];
//        self.department=[[NSString alloc]init];
//        self.date=[[NSString alloc]init];
//        self.voucher=[[NSString alloc]init];
//        self.bill=[[NSString alloc]init];
        }
    return self;
}

@end
