//
//  UIView+Responder.m
//  LibrarysDemo
//
//  Created by ys on 2017/4/27.
//  Copyright © 2017年 ys. All rights reserved.
//

#import "UIView+Responder.h"

@implementation UIView (Responder)
-(UIViewController*)viewOnCurrentVC{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}
@end
