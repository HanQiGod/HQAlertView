//
//  HLXibAlertView.m
//  HLAlertView
//
//  Created by Mr_Han on 2018/9/28.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//

#import "HLXibAlertView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface HLXibAlertView()


@property (weak, nonatomic) IBOutlet UILabel *tittleLable;
@property (weak, nonatomic) IBOutlet UILabel *messageLable;


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;


@end


@implementation HLXibAlertView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor =  [UIColor colorWithWhite:0.5 alpha:0.85];
} 

+ (void)alertWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^)(NSInteger))block{
    
    HLXibAlertView * alertView = [[NSBundle mainBundle] loadNibNamed:@"HLXibAlertView" owner:nil options:nil].firstObject;
    
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    alertView.title = tittle;
    alertView.message = message;
    alertView.xibButtonBlock = block;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:alertView];
    
    //弹出缩放动画
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 1;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [alertView.layer addAnimation:popAnimation forKey:nil];
    
}
- (IBAction)processSureButton:(id)sender {
    if (self.xibButtonBlock) {
        self.xibButtonBlock(XibAlertBlockSureButtonClick);
    }
    [self removeFromSuperview];
    
}
- (IBAction)processCauseButton:(id)sender {
    if (self.xibButtonBlock) {
        self.xibButtonBlock(XibAlertBlockCauseButtonClick);
    }
    [self removeFromSuperview];
}




- (void)setTitle:(NSString *)title{
    _title = title;
    _tittleLable.text = title;
}

- (void)setMessage:(NSString *)message{
    _message = message;
    _messageLable.text = message;
}

@end







