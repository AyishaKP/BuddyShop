//
//  SHFlashResponseHandler.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OCMapper/OCMapper.h>

@interface SHResponseMapper : NSObject
+ (void)configure;
+ (void)mapResponseWith:(InCodeMappingProvider *)inCodeMappingProvider;
@end
