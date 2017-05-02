//
//  TapView.m
//  LibrarysDemo
//
//  Created by ys on 2017/4/26.
//  Copyright © 2017年 ys. All rights reserved.
//

#import "TapView.h"

@implementation TapView

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"selftag point_________%@",@(self.tag));
    BOOL isInside = [super pointInside:point withEvent:event];
    NSLog(@"pointInside_________%@",@(isInside));
    return isInside;
}
//
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"selftag view_________%@",@(self.tag));
    UIView* view = [super hitTest:point withEvent:event];
    NSLog(@"selftag view2_________%@",@(self.tag));
    NSLog(@"tag_________%@",@(view.tag));
    return view;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if (self.userInteractionEnabled) {
//        for (UIView *view in self.subviews) {
//            if([view pointInside:point withEvent:event]){
//                UIView *hitTestView = [view hitTest:point withEvent:event];
//                if(!hitTestView){
//                    return view;
//                }
//            }
//        }
//    }
//    return nil;
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
