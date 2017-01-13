//
//  CalcLogic.m
//  UIButtonHomeTask
//
//  Created by VLAD on 11/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "CalcLogic.h"


@implementation CalcLogic {
    BOOL pointState;
    BOOL operation;
    BOOL divide;
    BOOL multiply;
    BOOL plus;
    BOOL minus;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tempData = @" ";
        self.firstData = @" ";
        self.secondData = @" ";
    }
    return self;
}


- (void)plus {
    
    if (operation) {
        [self operation];
    }
    
    pointState = NO;
    plus = YES;
    operation = YES;
    if ([self.firstData isEqualToString:@" "]) {
        self.firstData = self.tempData;
        self.tempData = @" ";
        
    } else {
        self.secondData = self.tempData;
        self.tempData = @" ";
        float i = [self.firstData floatValue] + [self.secondData floatValue];
        self.firstData = [NSString stringWithFormat:@"%g",i];
        [self.delegate updateDisplayWithData:[NSString stringWithFormat:@"%g",i]];
        
    }
    
    
}

- (void)minus {
    
    if (operation) {
        [self operation];
    }
    
    pointState = NO;
    minus = YES;
    operation = YES;
    if ([self.firstData isEqualToString:@" "]) {
        self.firstData = self.tempData;
        self.tempData = @" ";
        
    } else  if (![self.tempData isEqualToString:@" "]){
        self.secondData = self.tempData;
        self.tempData = @" ";
        float i = [self.firstData floatValue] - [self.secondData floatValue];
        self.firstData = [NSString stringWithFormat:@"%g",i];
        [self.delegate updateDisplayWithData:[NSString stringWithFormat:@"%g",i]];
        
    }
}

- (void)operation {
    
    if ([self.firstData isEqualToString:@" "]) {
        self.firstData = self.tempData;
        self.tempData = @" ";
        
    } else if (![self.tempData isEqualToString:@" "]) {
        self.secondData = self.tempData;
        self.tempData = @" ";
        float i = 0;
        if (plus) {
            i = [self.firstData floatValue] + [self.secondData floatValue];
            self.firstData = [NSString stringWithFormat:@"%g",i];
            plus = NO;
        } else if (minus) {
            i = [self.firstData floatValue] - [self.secondData floatValue];
            self.firstData = [NSString stringWithFormat:@"%g",i];
            minus = NO;
        } else if (divide) {
            i = [self.firstData floatValue] / [self.secondData floatValue];
            self.firstData = [NSString stringWithFormat:@"%g",i];
            divide = NO;
        } else if (multiply) {
            i = [self.firstData floatValue] * [self.secondData floatValue];
            self.firstData = [NSString stringWithFormat:@"%g",i];
            multiply = NO;
        }
        
        
        [self.delegate updateDisplayWithData:[NSString stringWithFormat:@"%@",self.firstData]];
        
    }
    
}

- (void)divide {
    
    if (operation) {
        [self operation];
    }
    
    pointState = NO;
    divide = YES;
    operation = YES;
    if ([self.firstData isEqualToString:@" "]) {
        self.firstData = self.tempData;
        self.tempData = @" ";
        
    } else if (![self.tempData isEqualToString:@" "]) {
        self.secondData = self.tempData;
        self.tempData = @" ";
        float i = [self.firstData floatValue] / [self.secondData floatValue];
        self.firstData = [NSString stringWithFormat:@"%g",i];
        [self.delegate updateDisplayWithData:[NSString stringWithFormat:@"%g",i]];
        
    }
}

- (void)multiply {
    
    if (operation) {
        [self operation];
    }
    
    pointState = NO;
    multiply = YES;
    operation = YES;
    if ([self.firstData isEqualToString:@" "]) {
        self.firstData = self.tempData;
        self.tempData = @" ";
        
    } else if (![self.tempData isEqualToString:@" "]) {
        self.secondData = self.tempData;
        self.tempData = @" ";
        float i = [self.firstData floatValue] * [self.secondData floatValue];
        self.firstData = [NSString stringWithFormat:@"%g",i];
        [self.delegate updateDisplayWithData:[NSString stringWithFormat:@"%g",i]];
        
    }
}

- (void)percent {
    
}

- (void)clear {
    
    self.tempData = @" ";
    self.firstData = @" ";
    self.secondData = @" ";
    pointState = NO;
    [self.delegate updateDisplayWithData:self.tempData];
}

- (void)addData:(NSString *)data {
    
    if ([data isEqualToString:@"."]) {
        if (!pointState) {
            self.tempData = [self.tempData stringByAppendingString:data];
            pointState = YES;
        }
        
    } else {
        self.tempData = [self.tempData stringByAppendingString:data];
    }
    
    [self.delegate updateDisplayWithData:self.tempData];
}

- (void)equals {
    
    if (operation) {
        [self operation];
    }
    
    operation = NO;
    [self.delegate updateDisplayWithData:self.firstData];
}

@end
