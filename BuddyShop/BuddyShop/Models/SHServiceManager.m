//
//  SHServiceManager.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHServiceManager.h"
#import "OCMapper.h"

@implementation SHServiceManager

+ (instancetype)sharedManager {
    static id sharedManager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.awok.com"]];
    });
    
    return sharedManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.requestSerializer setValue:@"en" forHTTPHeaderField:@"apilang"];
        [self.requestSerializer setValue:@"1832" forHTTPHeaderField:@"App-Version"];
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

- (void)getWithPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock {
    
    [self GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
        
        responseBlock((returnType) ? [returnType objectFromDictionary:JSON] : JSON, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        responseBlock(nil, error);
        
    }];
}

- (void)postWithPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock {
    
    [self POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
        
        responseBlock((returnType) ? [returnType objectFromDictionary:JSON] : JSON, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        responseBlock(nil, error);
        
    }];
}

- (void)postData:(NSDictionary *)dataDictionary withPath:(NSString *)path parameters:(NSDictionary *)parameters returnType:(Class)returnType completionBlock:(SMResponseBlock)responseBlock {
    
    [self POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSString *key in [dataDictionary allKeys]) {
            [formData appendPartWithFormData:dataDictionary[key] name:key];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        // do something
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
        
        responseBlock((returnType) ? [returnType objectFromDictionary:JSON] : JSON, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        responseBlock(nil, error);
        
    }];
}

@end
