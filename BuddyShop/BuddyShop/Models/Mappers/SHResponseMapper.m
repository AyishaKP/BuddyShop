//
//  SHResponseMapper.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHResponseMapper.h"
#import "SHResponse.h"

@implementation SHResponseMapper

+ (void)configure
{
    InCodeMappingProvider *inCodeMappingProvider = [[InCodeMappingProvider alloc] init];
    
    [SHResponseMapper mapResponseWith:inCodeMappingProvider];

    CommonLoggingProvider *commonLoggingProvider = [[CommonLoggingProvider alloc] initWithLogLevel:LogLevelInfo];
    
    [[ObjectMapper sharedInstance] setMappingProvider:inCodeMappingProvider];
    [[ObjectMapper sharedInstance] setLoggingProvider:commonLoggingProvider];
}

+ (void)mapResponseWith:(InCodeMappingProvider *)inCodeMappingProvider {
    
    /******************* Response - API **********************/
    
    [inCodeMappingProvider mapFromDictionaryKey:@"MAX_PAGES"
                                  toPropertyKey:@"maxPage"
                                       forClass:[SHOutputNavigation class]];
    
    /******************* Response - OUTPUT - DATA - ITEM **********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"ITEMS"
                                  toPropertyKey:@"items"
                                 withObjectType:[SHOutputDataItem class]
                                       forClass:[SHOutputData class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"ID"
                                  toPropertyKey:@"itemId"
                                       forClass:[SHOutputDataItem class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"ACTIVE_FROM"
                                  toPropertyKey:@"activeFrom"
                                       forClass:[SHOutputDataItem class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"ACTIVE_TO"
                                  toPropertyKey:@"activeTo"
                                       forClass:[SHOutputDataItem class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICE_NEW"
                                  toPropertyKey:@"priceNew"
                                       forClass:[SHOutputDataItemPrice class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICE_OLD"
                                  toPropertyKey:@"priceOld"
                                       forClass:[SHOutputDataItemPrice class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"D"
                                  toPropertyKey:@"day"
                                       forClass:[SHOutputDataItemTimer class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"H"
                                  toPropertyKey:@"hour"
                                       forClass:[SHOutputDataItemTimer class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"I"
                                  toPropertyKey:@"min"
                                       forClass:[SHOutputDataItemTimer class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"S"
                                  toPropertyKey:@"sec"
                                       forClass:[SHOutputDataItemTimer class]];
    
}

@end
