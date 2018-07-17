//
//  SHResponse.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OCMapper/OCMapper.h>

///STATUS///

@interface SHStatus : NSObject
@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *message;
@end

///API///
@interface SHAPI : NSObject
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *version;
@end

///OUTPUT NAVIGATION///
@interface SHOutputNavigation : NSObject
@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSString *maxPage;
@end

///OUTPUT DATA ITEM PRICE///
@interface SHOutputDataItemPrice : NSObject
@property (nonatomic, strong) NSNumber *priceOld;
@property (nonatomic, strong) NSNumber *priceNew;
@end

///OUTPUT DATA ITEM IMAGE///
@interface SHOutputDataItemImage : NSObject
@property (nonatomic, strong) NSString *src;
@end

///OUTPUT DATA ITEM TIMER///
@interface SHOutputDataItemTimer : NSObject
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *hour;
@property (nonatomic, strong) NSString *min;
@property (nonatomic, strong) NSString *sec;
@end

///OUTPUT DATA ITEM///
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

///OUTPUT DATA///
@interface SHOutputData : NSObject
@property (nonatomic, strong) NSArray<SHOutputDataItem *> *items;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *heading;
@end

///OUTPUT///
@interface SHOutput : NSObject
@property (nonatomic, strong) SHOutputNavigation *navigation;
@property (nonatomic, strong) SHOutputData *data;
@end
///BASE///
@interface SHResponse : NSObject
@property (nonatomic, strong) SHAPI *api;
@property (nonatomic, strong) SHOutput *output;
@property (nonatomic, strong) SHStatus *status;
@end



