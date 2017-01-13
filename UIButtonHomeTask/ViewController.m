//
//  ViewController.m
//  UIButtonHomeTask
//
//  Created by VLAD on 11/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CalcLogic* logic = [[CalcLogic alloc]init];
    
    self.calcLogic = logic;
    self.calcLogic.delegate = self;
    
    for (UIButton* tmpBtn in self.numpad) {
        [tmpBtn addTarget:self action:@selector(numPadPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

-(void)updateDisplayWithData:(NSString*)data {
    
    self.display.text = data;
}

-(void)numPadPress:(id)sender {
    
    UIButton *btn = sender;
    
    switch (btn.tag) {
        case 1:
            [self.calcLogic addData:btn.currentTitle];
            break;
        case 10:
            [self.calcLogic addData:btn.currentTitle];
            break;
        case 11:
            [self.calcLogic equals];
            break;
        case 12:
            [self.calcLogic plus];
            break;
        case 13:
            [self.calcLogic minus];
            break;
        case 14:
            [self.calcLogic multiply];
            break;
        case 15:
            [self.calcLogic divide];
            break;
        case 16:
            NSLog(@"%%");
            break;
        case 17:
            [self.calcLogic clear];
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
