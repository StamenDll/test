//
//  ViewController.h
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "RequsetClass.h"
#import "ManyMenuScrollView.h"
@interface ViewController : UIViewController<requestDelegate>
{
    SDCycleScrollView *titleScrollView;
    RequsetClass *selfRequest;
    ManyMenuScrollView *mView;
    
}

/**
 发送请求
 */
- (void)sendRequest:(int)type andPath:(NSString*)path andSqlParameter:(id)sqlParameter and:(id)deleget;
@end

