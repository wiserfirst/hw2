//
//  GameResult.h
//  Matchismo
//
//  Created by Wu Qing on 2/14/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+ (NSArray *)allGameResults;

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

- (NSComparisonResult)dateCompare:(GameResult*)otherResult;
- (NSComparisonResult)scoreCompare:(GameResult*)otherResult;
- (NSComparisonResult)durationCompare:(GameResult*)otherResult;

@end
