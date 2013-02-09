
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Wu Qing on 2/1/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (readwrite, nonatomic) int score;
@property (readwrite, nonatomic) int matchScore;
@property (nonatomic) NSUInteger matchNumber;
@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end

@implementation CardMatchingGame

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FILP_COST 1

- (NSString*)flipCardAtIndex: (NSUInteger)index
{
    Card *card = [self cardAtIndex: index];
    self.matchScore = -1;
    NSString *matchResult = @"";

    if (card && !card.isUnplayable)
    {
        if(!card.isFaceUp)
        {
            NSMutableArray *faceUpCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [faceUpCards addObject:otherCard];
                }
            }

            if ([faceUpCards count] < self.matchNumber - 1
                && [faceUpCards count] > 0) {
                if (![card Match: faceUpCards]) {
                    for (Card *otherCard in faceUpCards) {
                        otherCard.faceUp = NO;
                    }
                }
            } else if ([faceUpCards count] == self.matchNumber - 1) {
                int matchStore = [card Match: faceUpCards];
                if(matchStore)
                {
                    card.unplayable = YES;
                    for (Card *otherCard in faceUpCards) {
                        otherCard.unplayable = YES;
                    }
                    self.matchScore = matchStore * MATCH_BONUS * (self.matchNumber - 1);
                }else{
                    for (Card *otherCard in faceUpCards) {
                        otherCard.faceUp = NO;
                    }
                    self.matchScore = -MISMATCH_PENALTY * (self.matchNumber - 1);
                }
                self.score += self.matchScore;
                matchResult = [NSString stringWithFormat:@"%@ &%@ %@! Point %d!",
                                 card.contents, [Card getArrayContents:faceUpCards],
                                 self.matchScore > 0 ? @"Match":@"Mismatch",
                                 self.matchScore];
            }
            self.score -= FILP_COST;
        }
        card.faceUp = !card.isFaceUp;
        if (matchResult.length == 0) {
            matchResult = [NSString stringWithFormat:@"Flipped %@ %@",
                             card.contents, card.isFaceUp ? @"Up":@"Down"];
        }
    }

    return matchResult;
}

- (Card*)cardAtIndex: (NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (NSMutableArray*)cards
{
    if(!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck*)deck
        withMatchNumber:(NSUInteger)matchNumber
{
    self = [super init];
    
    if(self)
    {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if(card)
            {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
        self.matchNumber = matchNumber;
    }
    return self;
}

@end