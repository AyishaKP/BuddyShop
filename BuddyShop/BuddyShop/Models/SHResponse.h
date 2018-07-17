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

@interface SHFlashStatus : NSObject
@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *message;
@end

///API///
@interface SHFlashAPI : NSObject
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *version;
@end

///OUTPUT NAVIGATION///
@interface SHFlashOutputNavigation : NSObject
@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSString *maxPage;
@end

///OUTPUT DATA ITEM PRICE///
@interface SHFlashOutputDataItemPrice : NSObject
@property (nonatomic, strong) NSNumber *priceOld;
@property (nonatomic, strong) NSNumber *priceNew;
@end

///OUTPUT DATA ITEM IMAGE///
@interface SHFlashOutputDataItemImage : NSObject
@property (nonatomic, strong) NSString *src;
@end

///OUTPUT DATA ITEM TIMER///
@interface SHFlashOutputDataItemTimer : NSObject
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *hour;
@property (nonatomic, strong) NSString *min;
@property (nonatomic, strong) NSString *sec;
@end

///OUTPUT DATA ITEM///
@interface SHFlashOutputDataItem : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *activeFrom;
@property (nonatomic, strong) NSString *activeTo;
@property (nonatomic, strong) NSString *sort;
@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) SHFlashOutputDataItemPrice *prices;
@property (nonatomic, strong) SHFlashOutputDataItemImage *image;
@property (nonatomic, strong) SHFlashOutputDataItemTimer *timer;

@end

///OUTPUT DATA///
@interface SHFlashOutputData : NSObject
@property (nonatomic, strong) NSArray<SHFlashOutputDataItem *> *items;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *heading;
@end

///OUTPUT///
@interface SHFlashOutput : NSObject
@property (nonatomic, strong) SHFlashOutputNavigation *navigation;
@property (nonatomic, strong) SHFlashOutputData *data;
@end
///BASE///
@interface SHResponse : NSObject
@property (nonatomic, strong) SHFlashAPI *api;
@property (nonatomic, strong) SHFlashOutput *output;
@property (nonatomic, strong) SHFlashStatus *status;
@end



