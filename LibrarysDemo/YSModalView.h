//
//  YSModalView.h
//  LibrarysDemo
//
//  Created by ys on 2017/4/26.
//  Copyright © 2017年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSModalView : UIView
/*
 *strokeColor 边框颜色
 *canRespond 是否可以响应事件
 *modalViewsArray 需要模态的视图数组
 *modalRectsArray 需要模态的rect数组
 */
@property(nonatomic,strong)UIColor *strokeColor;
@property(nonatomic,assign)BOOL canRespond;
@property(nonatomic,copy)void(^tapModalBlock)();

@property(nonatomic,strong)NSArray *modalViewsArray;
@property(nonatomic,strong)NSArray<NSValue*> *modalRectsArray;
/** 创建模态 */
+(instancetype)YSModalViewOnSuperView:(UIView*)superView;
/** 修改属性后刷新模态 */
-(void)updateDisplay;

@end
