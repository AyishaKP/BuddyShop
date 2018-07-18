//
//  SHOutputTests.m
//  BuddyShopTests
//
//  Created by Ayisha on 18/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SHResponseMapper.h"
#import "SHResponse.h"

@interface SHOutputTests : XCTestCase
@property(nonatomic, strong) NSDictionary *jsonObject;
@end

@implementation SHOutputTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    [SHResponseMapper configure];
    
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

- (void)testInitWithDictionary {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    SHResponse *response = [SHResponse objectFromDictionary:_jsonObject];
    XCTAssertNotNil(response.output);
    XCTAssertGreaterThan(response.output.data.items.count, 0);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
