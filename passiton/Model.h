//
//  Model.h
//  passiton
//
//  Created by Aman on 2/27/16.
//  Copyright © 2016 Aman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *designation;
@property (nonatomic, strong) NSString *department;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *voucher;
@property (nonatomic, strong) NSString *bill;
@property (nonatomic, strong) NSString *salary;

+(Model *)sharedManager;
@end
