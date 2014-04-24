//
//  ViewController.m
//  AFWebservice
//
//  Created by aJia on 2014/4/24.
//  Copyright (c) 2014年 lz. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "ServiceArgs.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *params=[NSMutableArray array];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"695749595",@"qqCode", nil]];
    
    ServiceArgs *args=[[ServiceArgs alloc] init];
    args.methodName=@"qqCheckOnline";//要调用的webservice方法
    args.soapParams=params;//传递方法参数
    args.httpWay=ServiceHttpPost;
    
    /***方式一：
    AFHTTPRequestOperation *oper=[[AFHTTPRequestOperation alloc] initWithRequest:[args request]];
    //oper.responseSerializer=[[AFXMLParserResponseSerializer alloc] init];
    [oper setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"xml:%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"xml:%@",error);
    }];
    [oper start];
     ***/
    
    /***方式二：***/
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager HTTPRequestOperationWithArgs:args success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"xml:%@",operation.responseString);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
