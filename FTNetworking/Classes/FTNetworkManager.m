//
//  FTNetworkManager.m
//  FTNetworking
//
//  Created by yafei liu on 2021/4/10.
//

#import "FTNetworkManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation FTNetworkManager

- (void)testPrint:(NSString *)text {
    [AFHTTPSessionManager manager];
    NSLog(@"FTNetworkManager print == %@",text);
    
}

@end
