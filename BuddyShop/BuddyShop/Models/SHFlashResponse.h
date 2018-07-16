//
//  SHFlashResponse.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OCMapper/OCMapper.h>

///////---------------------------------------------////////

/*STATUS*/
@interface SHFlashStatus : NSObject
@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *message;
@end

///////---------------------------------------------////////

/*API*/
@interface SHFlashAPI : NSObject
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *version;


@end

///////---------------------------------------------////////

/*output->Navigation*/
@interface SHFlashOutputNavigation : NSObject
@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSNumber *maxPage;
@end

///////---------------------------------------------////////

/*output->Data->ITEM->PRICE*/
@interface SHFlashOutputDataItemPrice : NSObject
@property (nonatomic, strong) NSNumber *priceOld;
@property (nonatomic, strong) NSNumber *priceNew;
@end

/*output->Data->ITEM->Image*/
@interface SHFlashOutputDataItemImage : NSObject
@property (nonatomic, strong) NSString *src;
@end

/*output->Data->ITEM->Timer*/
@interface SHFlashOutputDataItemTimer : NSObject
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *hour;
@property (nonatomic, strong) NSString *min;
@property (nonatomic, strong) NSString *sec;
@end

/*output->Data->item->*/
@interface SHFlashOutputDataItem : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *activeFrom;
@property (nonatomic, strong) NSString *activeTo;
@property (nonatomic, strong) NSString *sort;
@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) SHFlashOutputDataItemPrice *price;
@property (nonatomic, strong) SHFlashOutputDataItemImage *image;
@property (nonatomic, strong) SHFlashOutputDataItemTimer *timer;

@end

/*output->Data*/
@interface SHFlashOutputData : NSObject
@property (nonatomic, strong) NSArray<SHFlashOutputDataItem *> *items;
@property (nonatomic, strong) NSString *title;
@end

/*OUTPUT*/
@interface SHFlashOutput : NSObject
@property (nonatomic, strong) SHFlashOutputNavigation *navigation;
@property (nonatomic, strong) SHFlashOutputData *data;
@end

///////---------------------------------------------////////

///////---------------------------------------------////////
@interface SHFlashResponse : NSObject
@property (nonatomic, strong) SHFlashAPI *api;
@property (nonatomic, strong) SHFlashOutput *output;
@property (nonatomic, strong) SHFlashStatus *status;
@end

///////---------------------------------------------////////

