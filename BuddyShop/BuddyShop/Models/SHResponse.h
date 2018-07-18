//
//  SHResponse.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OCMapper/OCMapper.h>

/// Used for mapping the keypath OUTPUT-NAVIGATION
@interface SHOutputNavigation : NSObject
@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSString *maxPage;
@end

/// Used for mapping the keypath OUTPUT-DATA-ITEM-PRICE///
@interface SHOutputDataItemPrice : NSObject
@property (nonatomic, strong) NSNumber *priceOld;
@property (nonatomic, strong) NSNumber *priceNew;
@end

/// Used for mapping the keypath OUTPUT-DATA-ITEM-IMAGE///
@interface SHOutputDataItemImage : NSObject
@property (nonatomic, strong) NSString *src;
@end

/// Used for mapping the keypath OUTPUT-DATA-ITEM-TIMER
@interface SHOutputDataItemTimer : NSObject
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *hour;
@property (nonatomic, strong) NSString *min;
@property (nonatomic, strong) NSString *sec;
@end

/// Used for mapping the keypath OUTPUT-DATA-ITEM
@interface SHOutputDataItem : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *activeFrom;
@property (nonatomic, strong) NSString *activeTo;
@property (nonatomic, strong) NSString *sort;
@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) SHOutputDataItemPrice *prices;
@property (nonatomic, strong) SHOutputDataItemImage *image;
@property (nonatomic, strong) SHOutputDataItemTimer *timer;

@end

/// Used for mapping the keypath OUTPUT-DATA
@interface SHOutputData : NSObject
@property (nonatomic, strong) NSArray<SHOutputDataItem *> *items;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *heading;
@end

/// OUTPUT
@interface SHOutput : NSObject
@property (nonatomic, strong) SHOutputNavigation *navigation;
@property (nonatomic, strong) SHOutputData *data;
@end

/// Used for mapping the keypath STATUS
@interface SHStatus : NSObject
@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *message;
@end

/// Used for mapping the keypath API
@interface SHAPI : NSObject
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *version;
@end

/// Used for mapping the response
@interface SHResponse : NSObject
@property (nonatomic, strong) SHAPI *api;
@property (nonatomic, strong) SHOutput *output;
@property (nonatomic, strong) SHStatus *status;
@end



