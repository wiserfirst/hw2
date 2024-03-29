//
//  PlayingCard.h
//  CardGame
//
//  Created by Wu Qing on 1/29/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*) validSuits;
+ (NSUInteger) maxRank;

@end