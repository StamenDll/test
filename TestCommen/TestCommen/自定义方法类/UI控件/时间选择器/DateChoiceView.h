//
//  DateChoiceView.h
//  XKFamilyDoctor
//
//  Created by Apple on 16/9/7.
//  Copyright © 2016年 Apple. All rights reserved.
//

@protocol DateChoiceDelegate <NSObject>
- (void)sureChoiceDate:(NSDate*)date;
- (void)cancelChoiceDate;
@end
@interface DateChoiceView : UIView
{
    UIDatePicker *datePicker;
}
- (void)initDateChoiceView:(NSString*)firstDateString andMinDateString:(NSString*)minDateString andMaxDateString:(NSString*)maxDateString;
@property(nonatomic,assign)id<DateChoiceDelegate>delegate;
@end
