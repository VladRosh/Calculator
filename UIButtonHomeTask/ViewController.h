//
//  ViewController.h
//  UIButtonHomeTask
//
//  Created by VLAD on 11/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalcLogic.h"

@interface ViewController : UIViewController <VVCalcLogicDelegate>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numpad;
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (strong, nonatomic) CalcLogic* calcLogic;


@end

