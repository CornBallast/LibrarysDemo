//
//  ViewController.m
//  LibrarysDemo
//
//  Created by ys on 2017/4/26.
//  Copyright © 2017年 ys. All rights reserved.
//

#import "ViewController.h"
#import "YSModalView.h"
#import "TapView.h"
#import "UIView+Responder.h"
@interface ViewController (){
    TapView *_frontView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.tag = 0;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
    //
    //[self tapTest];
    //[self testXYZL];
    //
    UIButton* testButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    testButton.userInteractionEnabled = YES;
    testButton.frame = CGRectMake(100, 100, 30, 30);
    testButton.center = self.view.center;
    [self.view addSubview:testButton];
    //
    YSModalView* modalView = [YSModalView YSModalViewOnSuperView:self.view];
    //modalView.canRespond = YES;
    modalView.strokeColor = [UIColor whiteColor];
    modalView.modalViewsArray = @[testButton];
    modalView.modalRectsArray = @[[NSValue valueWithCGRect:CGRectMake(10, 10, 20, 20)]];
    [modalView updateDisplay];
}

//测试tap事件的传递规则
-(void)tapTest{
    for (int i = 0; i< 3; i++) {
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        TapView* tapView = [[TapView alloc] initWithFrame:CGRectMake(100, 100, 175, 175)];
        tapView.tag = i + 1;
        tapView.backgroundColor = [UIColor redColor];
        [self.view addSubview:tapView];
        switch (i) {
            case 0:
                tapView.userInteractionEnabled = YES;
                [tapView addGestureRecognizer:tap];
                break;
            case 1:
                tapView.userInteractionEnabled = YES;
                [tapView addGestureRecognizer:tap];
                break;
            case 2:
                tapView.userInteractionEnabled = YES;
                _frontView = tapView;
                [tapView addGestureRecognizer:tap];
                break;
                
            default:
                break;
        }
    }
}



-(void)tapAction:(UITapGestureRecognizer*)tap{
    switch (tap.view.tag) {
        case 0:
            NSLog(@"self.view");
            break;
        case 1:
            NSLog(@"第一层");
            break;
        case 2:
            NSLog(@"第二层");
            break;
        case 3:
            NSLog(@"最上层");
            break;
        case 100:
            NSLog(@"小蓝图");
            break;
            
        default:
            break;
    }

}


-(void)testXYZL{
    
    UITapGestureRecognizer* tap_A = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    TapView* tapView_A = [[TapView alloc] initWithFrame:self.view.bounds];
    tapView_A.tag = 1;
    tapView_A.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:tapView_A];
    [tapView_A addGestureRecognizer:tap_A];
    
    
    UITapGestureRecognizer* tap_B = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    TapView* tapView_B = [[TapView alloc] initWithFrame:CGRectMake(20, 70 , 335, 170)];
    tapView_B.tag = 2;
    tapView_B.backgroundColor = [UIColor redColor];
    [tapView_A addSubview:tapView_B];
    [tapView_B addGestureRecognizer:tap_B];
    
    UITapGestureRecognizer* tap_C = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    TapView* tapView_C = [[TapView alloc] initWithFrame:CGRectMake(20, 260 , 335, 380)];
    tapView_C.tag = 3;
    tapView_C.userInteractionEnabled = NO;
    tapView_C.backgroundColor = [UIColor redColor];
    [tapView_A addSubview:tapView_C];
    [tapView_C addGestureRecognizer:tap_C];
    
    UITapGestureRecognizer* tap_D = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    TapView* tapView_D = [[TapView alloc] initWithFrame:CGRectMake(20, 100 , 295, 100)];
    tapView_D.tag = 4;
    tapView_D.backgroundColor = [UIColor greenColor];
    [tapView_C addSubview:tapView_D];
    [tapView_D addGestureRecognizer:tap_D];
    
    UITapGestureRecognizer* tap_E = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    TapView* tapView_E = [[TapView alloc] initWithFrame:CGRectMake(20, 210 , 295, 160)];
    tapView_E.tag = 5;
    tapView_E.backgroundColor = [UIColor greenColor];
    [tapView_C addSubview:tapView_E];
    [tapView_E addGestureRecognizer:tap_E];
    
    NSLog(@"%@",tapView_E.viewOnCurrentVC);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
