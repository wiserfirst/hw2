//
//  PlayingCard.m
//  CardGame
//
//  Created by Wu Qing on 1/29/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard

- (int)Match:(PlayingCard*) otherCard
{
    int store = 0;
    if (self.rank == otherCard.rank) {
        store = 4;
    }else if(self.suit == otherCard.suit){
        store = 1;
    }
    
    return store;
}

+ (NSArray*) validRanks
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+ (NSUInteger) maxRank
{
    NSUInteger rankCount = [self validRanks].count;
    return (rankCount - 1);
}
+ (NSArray*) validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (NSString*) contents
{
    NSArray *rankStrings = [PlayingCard validRanks];
    return [self.suit stringByAppendingString:rankStrings[self.rank]];
}

- (void) setRank:(NSUInteger)rank
{
    _rank = rank % [PlayingCard maxRank];
    _rank = _rank > 0 ? _rank : 13;
}

@synthesize suit = _suit;
- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
- (NSString*) suit
{
    return _suit ? _suit : @"?";
}

@end
