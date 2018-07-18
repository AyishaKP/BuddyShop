//
//  SHServiceManager.h
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

/// Type defining the response block
typedef void(^SMResponseBlock)(id result, NSError *error);

/**
 This class will be used to create an instance of afnetworking http session manager
 and can be used to customize the manager.
 */
@interface SHServiceManager : AFHTTPSessionManager

/// Singleton instance
+ (instancetype)sharedManager;

/// Make requests with http method 'GET'.
/// Parameters:-
/// path: path is used to provide the api endpoint
/// parameters: parameters is used to provide any required parameters to be given in the request
/// returnType: returnType is used to provide the class that will map the response
/// completionBlock: completionBlock is used to provide call back with result or error in the response
- (void)getWithPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock;

/// Make requests with http method 'POST'.
/// Parameters:-
/// path: path is used to provide the api endpoint
/// parameters: parameters is used to provide any required parameters to be given in the request
/// returnType: returnType is used to provide the class that will map the response
/// completionBlock: completionBlock is used to provide call back with result or error in the response
- (void)postWithPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock;

/// Make mutlipart POST requests.
/// Parameters:-
/// dataDictionary: dataDictionary is used to provide any image or file to be given in the multipart request
/// path: path is used to provide the api endpoint
/// parameters: parameters is used to provide any required parameters to be given in the request
/// returnType: returnType is used to provide the class that will map the response
/// completionBlock: completionBlock is used to provide call back with result or error in the response
- (void)postData:(NSDictionary *)dataDictionary withPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock;

@end
