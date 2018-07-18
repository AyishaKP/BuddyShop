//
//  SHServiceManager.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHServiceManager.h"
#import "OCMapper.h"

static NSString * const baseUrl = @"http://www.awok.com";
static NSString * const apiLang = @"en";

@implementation SHServiceManager

+ (instancetype)sharedManager {
    static id sharedManager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
    });
    
    return sharedManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.requestSerializer setValue:apiLang forHTTPHeaderField:@"apilang"];
        
        NSString * appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        [self.requestSerializer setValue:appVersionString forHTTPHeaderField:@"App-Version"];
        
        /// Incase Certificate Pinning is needed, use the code below and add name of certificate fies added to the bundle.
        /*
        AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
        
        self.securityPolicy = policy;
        
        NSArray *certificates = @[];
        
        NSMutableSet *certificatesSet = [[NSMutableSet alloc] initWithCapacity:certificates.count];
        
        for (NSString *certificate in certificates) {
            
            NSString *pathToCert = [[NSBundle mainBundle]pathForResource:certificate ofType:@"cer"];
            NSData *certData = [NSData dataWithContentsOfFile:pathToCert];
            [certificatesSet addObject:certData];
        }
        
        self.securityPolicy.pinnedCertificates = certificatesSet;
         */
    }
    return self;
}

/// Make requests with http method 'GET'.
/// Parameters:-
/// path: path is used to provide the api endpoint
/// parameters: parameters is used to provide any required parameters to be given in the request
/// returnType: returnType is used to provide the class that will map the response
/// completionBlock: completionBlock is used to provide call back with result or error in the response
- (void)getWithPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock {
    
    [self GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable jsonDictionary) {
        
        responseBlock((returnType) ? [returnType objectFromDictionary:jsonDictionary] : jsonDictionary, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        responseBlock(nil, error);
        
    }];
}

/// Make requests with http method 'POST'.
/// Parameters:-
/// path: path is used to provide the api endpoint
/// parameters: parameters is used to provide any required parameters to be given in the request
/// returnType: returnType is used to provide the class that will map the response
/// completionBlock: completionBlock is used to provide call back with result or error in the response
- (void)postWithPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock {
    
    [self POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable jsonDictionary) {
        
        responseBlock((returnType) ? [returnType objectFromDictionary:jsonDictionary] : jsonDictionary, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        responseBlock(nil, error);
        
    }];
}

/// Make mutlipart POST requests.
/// Parameters:-
/// dataDictionary: dataDictionary is used to provide any image or file to be given in the multipart request
/// path: path is used to provide the api endpoint
/// parameters: parameters is used to provide any required parameters to be given in the request
/// returnType: returnType is used to provide the class that will map the response
/// completionBlock: completionBlock is used to provide call back with result or error in the response
- (void)postData:(NSDictionary *)dataDictionary withPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock {
    
    [self POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSString *key in [dataDictionary allKeys]) {
            [formData appendPartWithFormData:dataDictionary[key] name:key];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        // do something
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable jsonDictionary) {
        
        responseBlock((returnType) ? [returnType objectFromDictionary:jsonDictionary] : jsonDictionary, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        responseBlock(nil, error);
        
    }];
}

@end
