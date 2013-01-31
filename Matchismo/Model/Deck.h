//
//  Deck.h
//  CardGame
//
//  Created by Wu Qing on 1/29/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card*) card atTop:(BOOL) atTop;
- (Card*) drawRandomCard;

@end
