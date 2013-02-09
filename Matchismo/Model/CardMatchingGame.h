//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Wu Qing on 2/1/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initialize
- (id)initWithCardCount:(NSUInteger)count
              usingDeck: (Deck*)deck
        withMatchNumber:(NSUInteger)matchNumber;

- (NSString*)flipCardAtIndex: (NSUInteger)index;

- (Card*)cardAtIndex: (NSUInteger)index;

@property (readonly, nonatomic) int score;
@property (readonly, nonatomic) int matchScore;
//@property (weak, nonatomic) Card *lastCard;
//@property (weak, nonatomic) Card *currentCard;

@end
