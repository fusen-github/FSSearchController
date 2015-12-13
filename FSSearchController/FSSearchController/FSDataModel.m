//
//  FSDataModel.m
//  FSSearchController
//
//  Created by 四维图新 on 15/12/13.
//  Copyright (c) 2015年 四维图新. All rights reserved.
//

#import "FSDataModel.h"

@implementation FSDataModel

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

+ (instancetype)dataModelWithDict:(NSDictionary *)dict
{
    FSDataModel *model = [[FSDataModel alloc] init];
    
    model.active = dict[@"Active"];
    
//    model.idx = dict[@"\'Airline ID'\"];
    
    model.alias = dict[@"Alias"];
    
    model.callsign = dict[@"Callsign"];
    
    model.country = dict[@"Country"];
    
    model.icao = dict[@"ICAO"];
    
    model.name = dict[@"Name"];
    
    return model;
}


+ (NSArray *)dataModelArr
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"airlineData" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    NSArray *dictArr = [dict objectForKey:@"airlines"];
    
    NSMutableArray *tmpArr = [NSMutableArray array];
    
    if (error == nil)
    {
        for (NSDictionary *itemDic in dictArr)
        {
            FSDataModel *model = [FSDataModel dataModelWithDict:itemDic];
            
            [tmpArr addObject:model];
        }
    }
    
    return tmpArr;
}






@end
