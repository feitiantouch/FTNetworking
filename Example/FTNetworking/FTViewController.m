//
//  FTViewController.m
//  FTNetworking
//
//  Created by yafei liu on 04/10/2021.
//  Copyright (c) 2021 yafei liu. All rights reserved.
//

#import "FTViewController.h"
#import <FTNetworking/FTNetworkManager.h>
#import <AFNetworking/AFNetworking.h>

@interface FTViewController ()

@end

@implementation FTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [AFHTTPSessionManager manager];
    [[[FTNetworkManager alloc] init] testPrint:@"fffff"];
    NSString *fwPath = [[NSBundle mainBundle] pathForResource:@"FTNetworking" ofType:nil];
    NSBundle *fwbd = [NSBundle bundleWithPath:fwPath];
    NSString *bdPath = [fwbd pathForResource:@"FTNetworking" ofType:@"bundle"];
    NSBundle *bd = [NSBundle bundleWithPath:bdPath];
    UIImage *bgImage = [UIImage imageNamed:@"icon_accessory_selected@" inBundle:bd withConfiguration:nil];
    NSLog(@"%@",bgImage);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
