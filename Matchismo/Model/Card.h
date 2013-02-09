//
//  Card.h
//  CardGame
//
//  Created by Wu Qing on 1/28/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int) Match: (NSArray *) otherCards;
//- (int) MatchOther: (NSArray *) otherCards;

+ (NSString*)getArrayContents:(NSArray*)cards;
@end
