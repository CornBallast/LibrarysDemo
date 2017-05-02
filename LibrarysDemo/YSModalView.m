//
//  YSModalView.m
//  LibrarysDemo
//
//  Created by ys on 2017/4/26.
//  Copyright © 2017年 ys. All rights reserved.
//

#import "YSModalView.h"

@implementation YSModalView

/** 创建模态 */
+(instancetype)YSModalViewOnSuperView:(UIView*)superView{
    if (!superView) {
        return nil;
    }
    YSModalView *modalView = [[YSModalView alloc] initWithFrame:superView.bounds];
    modalView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:modalView action:@selector(tapModalView:)];
    [modalView addGestureRecognizer:tap];
    modalView.backgroundColor = [UIColor clearColor];
    [superView addSubview:modalView];
    return modalView;
}

-(void)tapModalView:(UITapGestureRecognizer*)tap{
    if (self.tapModalBlock) self.tapModalBlock();
}

/** 修改属性后刷新模态 */
-(void)updateDisplay{
    [self setNeedsDisplay];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.canRespond) {
        for (NSValue *viewValue in [self allRectArray]) {
            CGRect viewRect = viewValue.CGRectValue;
            viewRect = [self convertRect:viewRect toView:self];
            if (CGRectContainsPoint(viewRect, point)) {
                return NO;
            }
        }
    }
    return YES;
}

-(void)drawRect:(CGRect)rect{
    UIBezierPath *backBezierPath = [UIBezierPath bezierPathWithRect:self.bounds];
    backBezierPath.usesEvenOddFillRule = YES;
    backBezierPath.lineWidth = 0;
    //
    UIBezierPath *strokePath = [UIBezierPath bezierPath];
    strokePath.lineWidth = 2;
    for (NSValue *viewValue in [self allRectArray]) {
        //按钮镂空位置
        CGRect viewRect = viewValue.CGRectValue;
        viewRect = [self convertRect:viewRect toView:self];
        UIBezierPath *viewPath = [UIBezierPath bezierPathWithRoundedRect:viewRect cornerRadius:5];
        [backBezierPath appendPath:viewPath];
        //虚线
        UIBezierPath *oneStrokePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(viewRect.origin.x - 2, viewRect.origin.y - 2, viewRect.size.width + 4, viewRect.size.height + 4) cornerRadius:5];
        [strokePath appendPath:oneStrokePath];
    }
    [[[UIColor blackColor] colorWithAlphaComponent:0.5] setFill];
    [backBezierPath fill];
    //
    CGFloat dash[] = {5,3};
    [strokePath setLineDash:dash count:2 phase:0];

    [self.strokeColor setStroke];
    [strokePath stroke];
}
//
-(NSArray<NSValue*>*)allRectArray{
    NSMutableArray* allRectArray = [NSMutableArray arrayWithArray:self.modalRectsArray];
    for (UIView* view in self.modalViewsArray) {
        [allRectArray addObject:[NSValue valueWithCGRect:view.frame]];
    }
    return allRectArray;
}

@end
