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

- (int) Match: (NSArray *) otherCards
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

+ (NSString*)getArrayContents:(NSArray*)cards
{
    NSString* result;
    for (id obj in cards) {
        if([obj isKindOfClass:[Card class]])
        {
            Card *card = (Card*)obj;
            if (!result.length) {
                result = card.contents;
            }else{
                result = [NSString stringWithFormat:@"%@ &%@", result, card.contents];
            }
        }
    }
    
    return result;
}

@end
