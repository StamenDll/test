//
//  RequsetClass.m
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import "RequsetClass.h"

@implementation RequsetClass
//Get请求

- (void)startGetRequestInfo{
    manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    [manager setSecurityPolicy:securityPolicy];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",nil];
    NSLog(@"startget URL:%@", self.url);
    
    [manager GET:self.url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([self.delegate respondsToSelector:@selector(requestSuccess:andURL:)]&&self.delegate!=nil) {
            NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            [self.delegate requestSuccess:string andURL:self.url];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code==-1009) {
            UIAlertView *av=[[UIAlertView alloc]initWithTitle:nil message:@"网络错误，请检查您的网络后重试！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [av show];
        }else if ([self.delegate respondsToSelector:@selector(requestFail:)]&&self.delegate!=nil) {
            [self.delegate requestFail:self.url];
        }
    }];
}

- (void)startPostRequestInfo{
    manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval =10;
    manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/plain",nil];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//            [manager.requestSerializer setValue:@"DEF4C7B-9BED-4585-A3F7-EA1C7143A03B" forHTTPHeaderField:@"Authorization"];
//            [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//            [manager.requestSerializer setValue:@"raw" forHTTPHeaderField:@"Content-Type"];
    
    NSLog(@"startPost URL:%@", self.url);
    NSLog(@"startPost dic:%@", self.dic);
//    if ([self.type isEqualToString:@"GetSureOrderCode"]||[self.type isEqualToString:@"GetCode"]||[self.type isEqualToString:@"SendMessage"]) {
//        self.path=@"http://116.52.164.59:7702/home_doctor_main/sql/excute";
//    }
    
    [manager POST:self.url parameters:_dic progress:^(NSProgress * _Nonnull uploadProgress) {}
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              if ([self.delegate respondsToSelector:@selector(requestSuccess:andURL:)]&&self.delegate!=nil) {
                  [self.delegate requestSuccess:responseObject andURL:self.url];
              }
                      NSLog(@"==11111111=%@",responseObject);
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"===================%@",error);
              UIAlertView *av=[[UIAlertView alloc]initWithTitle:nil message:@"网络错误，请检查您的网络后重试！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
              [av show];
              if ([self.delegate respondsToSelector:@selector(requestFail:)]&&self.delegate!=nil) {
                  [self.delegate requestFail:self.url];
              }
          }];
}




@end
