//
//  SHResponseMapper.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHResponseMapper.h"
#import "SHFlashMapper.h"
#import "SHHomeAPIMapper.h"
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
                                       forClass:[SHFlashOutputNavigation class]];
    
    /******************* Response - OUTPUT - DATA - ITEM **********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"ITEMS"
                                  toPropertyKey:@"items"
                                 withObjectType:[SHFlashOutputDataItem class]
                                       forClass:[SHFlashOutputData class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"ID"
                                  toPropertyKey:@"itemId"
                                       forClass:[SHFlashOutputDataItem class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"ACTIVE_FROM"
                                  toPropertyKey:@"activeFrom"
                                       forClass:[SHFlashOutputDataItem class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"ACTIVE_TO"
                                  toPropertyKey:@"activeTo"
                                       forClass:[SHFlashOutputDataItem class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICE_NEW"
                                  toPropertyKey:@"priceNew"
                                       forClass:[SHFlashOutputDataItemPrice class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICE_OLD"
                                  toPropertyKey:@"priceOld"
                                       forClass:[SHFlashOutputDataItemPrice class]];
    
    [inCodeMappingProvider mapFromDictionaryKey:@"D"
                                  toPropertyKey:@"day"
                                       forClass:[SHFlashOutputDataItemTimer class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"H"
                                  toPropertyKey:@"hour"
                                       forClass:[SHFlashOutputDataItemTimer class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"I"
                                  toPropertyKey:@"min"
                                       forClass:[SHFlashOutputDataItemTimer class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"S"
                                  toPropertyKey:@"sec"
                                       forClass:[SHFlashOutputDataItemTimer class]];
    
}

@end
