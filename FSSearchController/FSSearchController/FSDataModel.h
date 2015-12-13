//
//  FSDataModel.h
//  FSSearchController
//
//  Created by 四维图新 on 15/12/13.
//  Copyright (c) 2015年 四维图新. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSDataModel : NSObject

/*
 {
 Active = N;
 "Airline ID" = 2;
 Alias = "\\N";
 Callsign = GENERAL;
 Country = "United States";
 ICAO = GNL;
 Name = "135 Airways";
 }
 */

@property (nonatomic, copy) NSString *active;

//@property (nonatomic, assign) int idx;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *callsign;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *icao;

@property (nonatomic, copy) NSString *name;


+ (instancetype)dataModelWithDict:(NSDictionary *)dict;



+ (NSArray *)dataModelArr;


@end
