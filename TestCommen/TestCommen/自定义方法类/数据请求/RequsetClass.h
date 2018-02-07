//
//  RequsetClass.h
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol requestDelegate <NSObject>
//请求成功回调方法
-(void)requestSuccess:(id)message andURL:(NSString *)url;
//请求失败回调方法
-(void)requestFail:(NSString*)url;
@end

@interface RequsetClass : NSObject
{
    AFHTTPSessionManager *manager;
}
//请求地址
@property(nonatomic,copy)NSString *url;
//post请求参数字典
@property(nonatomic,copy)NSDictionary *dic;

@property(nonatomic,assign)id<requestDelegate>delegate;

- (void)startGetRequestInfo;

- (void)startPostRequestInfo;

- (void)startPostNoHeaderInfo;

- (void)cancelRequest;
@end
