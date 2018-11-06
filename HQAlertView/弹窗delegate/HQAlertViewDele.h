//
//  HQAlertViewDele.h
//  HQAlertView
// 
//  Created by Mr_Han on 2018/9/28.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AlertCauseButtonClick = 0,
    AlertSureButtonClick
} AlertButtonClickIndex;

#pragma mark - 协议
@class HQAlertViewDele;
@protocol HQAlertViewDelegate<NSObject>
- (void)alertViewDidClickButtonWithIndex:(NSInteger)index;
@end



@interface HQAlertViewDele : UIView

@property(nonatomic, weak) id <HQAlertViewDelegate> delegate;

- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message sureButton:(NSString *)sureBtn;
- (void)show;

@end
