//
//  SHResponseHandler.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OCMapper/OCMapper.h>

/**
 This class will be used to configure the mapping and provide the ObjectMapper with a InCodeMappingProvider instance which will have all possible custom mappings specified.
 */
@interface SHResponseMapper : NSObject

 /// This method will provide the ObjectMapper with a InCodeMappingProvider instance which will have all possible custom mappings specified.
+ (void)configure;

@end
