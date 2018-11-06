//
//  HLXibAlertView.h
//  HLAlertView
//
//  Created by Mr_Han on 2018/9/28.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
// 

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    XibAlertBlockCauseButtonClick = 0,
    XibAlertBlockSureButtonClick
} XibAlertBlockButtonClickIndex;


@interface HLXibAlertView : UIView
@property(nonatomic, copy) void (^xibButtonBlock) (NSInteger index);

+ (void)alertWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^)(NSInteger))block;


@end
