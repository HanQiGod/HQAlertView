//
//  HQAlertViewBlock.h
//  HQAlertView
//
//  Created by Mr_Han on 2018/9/28.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
// 

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AlertBlockCauseButtonClick = 0,
    AlertBlockSureButtonClick
} AlertBlockButtonClickIndex;
NS_ASSUME_NONNULL_BEGIN

@interface HQAlertViewBlock : UIView

@property(nonatomic, copy) void (^buttonBlock) (NSInteger index);

- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^) (NSInteger index))block;

- (void)show;

@end

NS_ASSUME_NONNULL_END
