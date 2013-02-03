//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Wu Qing on 2/1/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (readwrite, nonatomic) int store;
@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end

@implementation CardMatchingGame

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FILP_COST 1

- (void)flipCardAtIndex: (NSUInteger)index
{
    Card *card = [self cardAtIndex: index];
    
    if (card && !card.isUnplayable)
    {
        if(!card.faceUp)
        {
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchStore = [card Match: otherCard];
                    if(matchStore)
                    {
                        card.unplayable = YES;
                        otherCard.unplayable = YES;
                        self.store += matchStore * MATCH_BONUS;
                    }else{
                        otherCard.faceUp = NO;
                        self.store -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.store -= FILP_COST;
        }
        card.faceUp = !card.faceUp;
    }
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
              usingDeck: (Deck*)deck
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
    }
    return self;
}

@end