//
//  SHServiceManager.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^SMResponseBlock)(id result, NSError *error);

@interface SHServiceManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)getWithPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock;
- (void)postWithPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock;
- (void)postData:(NSDictionary *)dataDictionary withPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock;

@end
