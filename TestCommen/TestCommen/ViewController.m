//
//  ViewController.m
//  TestCommen
//
//  Created by XKXX_Apple on 2018/1/31.
//  Copyright © 2018年 XKXX. All rights reserved.
//

#import "ViewController.h"
#import "DateChoiceView.h"
#import "ManyMenuScrollView.h"
@interface ViewController ()<DateChoiceDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"测试";
    
//    UIImageView *image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 100)];
//    image1.backgroundColor=[UIColor redColor];
//
//    UIImageView *image2=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 100)];
//    image2.backgroundColor=[UIColor orangeColor];
//
//    UIImageView *image3=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 100)];
//    image3.backgroundColor=[UIColor greenColor];
//
//    NSArray *imageArray=@[image1,image2,image3];
//    titleScrollView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, NAVHEIGHT+10, SCREENWIDTH, 100) imageNamesGroup:imageArray];
//    [self.view addSubview:titleScrollView];
//
//
//    UIImageView *upima=[UIControlClass addImageView:CGRectMake(0, titleScrollView.frame.origin.y+titleScrollView.frame.size.height+10, 100, 100) andName:@""];
//    upima.backgroundColor=[UIColor redColor];
//    [self.view addSubview:upima];
//
//    [UIControlClass addImageView:CGRectMake(110, titleScrollView.frame.origin.y+titleScrollView.frame.size.height+10, 100, 100) andName:@"" andBGView:self.view];
//
//    UILabel *nameLabel=[UIControlClass addLabel:CGRectMake(10, upima.frame.origin.y+upima.frame.size.height+10, SCREENWIDTH-20, 20) andText:@"测试" andFont:14 andColor:[UIColor redColor] andAlignment:1 andTag:0];
//    [self.view addSubview:nameLabel];
//
//    [UIControlClass addLabel:CGRectMake(10, nameLabel.frame.origin.y+nameLabel.frame.size.height+10, SCREENWIDTH-20, 20) andText:@"测试" andFont:14 andColor:[UIColor redColor] andAlignment:1 andTag:0 andBGView:self.view];
//
//    UIButton *testButton=[UIControlClass addButton:CGRectMake(0, nameLabel.frame.origin.y+nameLabel.frame.size.height+30, SCREENWIDTH, 30) adnColor:[UIColor clearColor] andTag:101 andText:@"测试" andFont:14 andColor:[UIColor redColor] andAlignment:1];
//    [testButton addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:testButton];
//
//    [UIControlClass addLineLabel:CGRectMake(0, testButton.frame.origin.y+testButton.frame.size.height+30, SCREENWIDTH, 0.5) andColor:[UIColor grayColor] andBackView:self.view];
    
    mView=[[ManyMenuScrollView alloc]initWithFrame:CGRectMake(0, NAVHEIGHT, SCREENWIDTH, SCREENHEIGHT)];
    mView.choiceColor=[UIColor orangeColor];
    [self.view addSubview:mView];
    
    [self sendRequest:1 andPath:GETURLLIST andSqlParameter:@{@"authtype":@"2",@"username":@"008",@"password":@"008"} and:self];
    
    NSLog(@"呵呵呵");
    
}

- (void)onclick:(UIButton*)btn{
    DateChoiceView *dateView=[[DateChoiceView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-200, SCREENWIDTH, 200)];
    [dateView initDateChoiceView:@"2018-01-20" andMinDateString:@"2018-01-20" andMaxDateString:@"2018-01-20"];
    dateView.delegate=self;
    [self.view addSubview:dateView];
}



- (void)sendRequest:(int)type andPath:(NSString*)path andSqlParameter:(id)sqlParameter and:(id)deleget{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            selfRequest=[[RequsetClass alloc]init];
            selfRequest.url=path;
            selfRequest.delegate=deleget;
            if ([sqlParameter isKindOfClass:[NSDictionary class]]) {
                selfRequest.dic=sqlParameter;
            }else{
//                SQLItem *item=[SQLItem new];
//                NSString *sqlString=[item returnSqlString:sqlParameter andType:type];
//                selfRequest.dic=@{@"sql":sqlString};
            }
            switch (type) {
                case 0:
                    [selfRequest startGetRequestInfo];
                    break;
                default:
                    [selfRequest startPostRequestInfo];
                    break;
            }
        });
    });
}

- (void)requestSuccess:(id)message andURL:(NSString *)url{
    NSLog(@"===============%@",message);
    [mView addTitleView:@[@"主页",@"值得买",@"国内商家",@"海外商家",@"跨境商家",@"跨境商家"]];
}

- (void)requestFail:(NSString *)url{
    
}

- (void)sureChoiceDate:(NSDate *)date{
    
}

- (void)cancelChoiceDate{}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
