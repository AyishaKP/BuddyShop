//
//  SHResponseMapperTests.m
//  BuddyShopTests
//
//  Created by Ayisha on 18/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SHResponseMapper.h"
#import "SHResponse.h"

@interface SHResponseMapperTests : XCTestCase
@property(nonatomic, strong) NSDictionary *jsonObject;
@end

@implementation SHResponseMapperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MockResponse" ofType:@"json"];
    
    // Load the file into an NSData object called JSONData
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    // Create an Objective-C object from JSON Data
    
    _jsonObject = [NSJSONSerialization
                     JSONObjectWithData:JSONData
                     options:NSJSONReadingAllowFragments
                     error:&error];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConfigure {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    [SHResponseMapper configure];
    SHResponse *response = [SHResponse objectFromDictionary:_jsonObject];
    
    XCTAssertNotNil(response);
    XCTAssertGreaterThan(response.output.data.items.count, 0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [SHResponseMapper configure];
    }];
}

@end
