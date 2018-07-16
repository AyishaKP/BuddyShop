//
//  SHFlashResponseHandler.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHFlashResponseHandler.h"
#import "SHFlashResponse.h"

@implementation SHFlashResponseHandler
+ (void)configure
{
    InCodeMappingProvider *inCodeMappingProvider = [[InCodeMappingProvider alloc] init];
    CommonLoggingProvider *commonLoggingProvider = [[CommonLoggingProvider alloc] initWithLogLevel:LogLevelInfo];
    
    [[ObjectMapper sharedInstance] setMappingProvider:inCodeMappingProvider];
    [[ObjectMapper sharedInstance] setLoggingProvider:commonLoggingProvider];
    
    /******************* Response - API **********************/
    
    [inCodeMappingProvider mapFromDictionaryKey:@"API"
                                  toPropertyKey:@"api"
                                 withObjectType:[SHFlashAPI class]
                                       forClass:[SHFlashResponse class]];

    [inCodeMappingProvider mapFromDictionaryKey:@"LANG"
                                  toPropertyKey:@"language"
                                       forClass:[SHFlashAPI class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"CURRENCY"
                                  toPropertyKey:@"currency"
                                       forClass:[SHFlashAPI class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"VERSION"
                                  toPropertyKey:@"version"
                                       forClass:[SHFlashAPI class]];
    
    /******************* Response - STATUS **********************/
    
    [inCodeMappingProvider mapFromDictionaryKey:@"STATUS"
                                  toPropertyKey:@"status"
                                 withObjectType:[SHFlashStatus class]
                                       forClass:[SHFlashResponse class]];
    
        [inCodeMappingProvider mapFromDictionaryKey:@"CODE"
                                  toPropertyKey:@"code"
                                       forClass:[SHFlashStatus class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"MESSAGE"
                                  toPropertyKey:@"message"
                                       forClass:[SHFlashStatus class]];
    
    /******************* Response - OUTPUT **********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"OUTPUT"
                                  toPropertyKey:@"output"
                                 withObjectType:[SHFlashOutput class]
                                       forClass:[SHFlashResponse class]];
    
    /******************* Response - OUTPUT - NAVIGATION**********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"NAVIGATION"
                                  toPropertyKey:@"navigation"
                                 withObjectType:[SHFlashOutputNavigation class]
                                       forClass:[SHFlashOutput class]];
    
    /******************* Response - OUTPUT - DATA **********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"DATA"
                                  toPropertyKey:@"data"
                                 withObjectType:[SHFlashOutputData class]
                                       forClass:[SHFlashOutput class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"TITLE"
                                  toPropertyKey:@"title"
                                       forClass:[SHFlashOutputData class]];
    
    
    /******************* Response - OUTPUT - DATA - ITEM **********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"ITEM"
                                  toPropertyKey:@"items"
                                 withObjectType:[SHFlashOutputDataItem class]
                                       forClass:[SHFlashOutputData class]];
    
    
    [inCodeMappingProvider mapFromDictionaryKey:@"NAME"
                                  toPropertyKey:@"name"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"ID"
                                  toPropertyKey:@"itemId"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"ACTIVE_FROM"
                                  toPropertyKey:@"activeFrom"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"ACTIVE_FROM"
                                  toPropertyKey:@"activeTo"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"SORT"
                                  toPropertyKey:@"sort"
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"STATE"
                                  toPropertyKey:@"state"
                                       forClass:[SHFlashOutputDataItem class]];
    
    /******************* Response - OUTPUT - DATA - ITEM - PRICE**********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICES"
                                  toPropertyKey:@"price"
                                 withObjectType:[SHFlashOutputDataItemPrice class]
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICE_NEW"
                                  toPropertyKey:@"priceNew"
                                       forClass:[SHFlashOutputDataItemPrice class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"PRICE_OLD"
                                  toPropertyKey:@"priceOld"
                                       forClass:[SHFlashOutputDataItemPrice class]];
    /******************* Response - OUTPUT - DATA - ITEM - IMAGE**********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"IMAGE"
                                  toPropertyKey:@"image"
                                 withObjectType:[SHFlashOutputDataItemImage class]
                                       forClass:[SHFlashOutputDataItem class]];
    [inCodeMappingProvider mapFromDictionaryKey:@"SRC"
                                  toPropertyKey:@"src"
                                       forClass:[SHFlashOutputDataItemImage class]];
    
    /******************* Response - OUTPUT - DATA - ITEM - TIMER**********************/
    [inCodeMappingProvider mapFromDictionaryKey:@"TIMER"
                                  toPropertyKey:@"timer"
                                 withObjectType:[SHFlashOutputDataItemTimer class]
                                       forClass:[SHFlashOutputDataItem class]];
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
