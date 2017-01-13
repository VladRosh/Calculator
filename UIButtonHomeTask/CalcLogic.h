//
//  CalcLogic.h
//  UIButtonHomeTask
//
//  Created by VLAD on 11/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VVCalcLogicDelegate;

@interface CalcLogic : NSObject

@property (strong, nonatomic) NSString* firstData;
@property (strong, nonatomic) NSString* secondData;
@property (strong, nonatomic) NSString* tempData;

@property (weak, nonatomic) id <VVCalcLogicDelegate> delegate;

-(void)plus;
-(void)minus;
-(void)divide;
-(void)multiply;
-(void)percent;
-(void)addData:(NSString*)data;
-(void)equals;
-(void)clear;


@end

@protocol VVCalcLogicDelegate <NSObject>

-(void)updateDisplayWithData:(NSString*)data;

@end
