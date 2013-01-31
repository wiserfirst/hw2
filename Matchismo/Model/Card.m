//
//  Card.m
//  CardGame
//
//  Created by Wu Qing on 1/28/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize faceUp = _faceUp;
@synthesize unplayable = _unplayable;

- (BOOL) isFaceUp
{
    return _faceUp;
}

- (void) setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
}

- (BOOL) isUnplayable
{
    return _unplayable;
}

- (void) setUnplayable:(BOOL)unplayable
{
    _unplayable = unplayable;
}

- (int) Match:(Card *)card
{
    int store = 0;
    
    if([self.contents isEqualToString: card.contents])
    {
        store = 1;
    }
    
    return store;
}

- (int) MatchOther:(NSArray *)otherCards
{
    int store = 0;
    
    for (Card *card in otherCards) {
        if([self.contents isEqualToString: card.contents])
        {
            store++;
        }
    }

    return store;
}

@end
