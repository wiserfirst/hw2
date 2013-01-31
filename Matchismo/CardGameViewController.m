//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Wu Qing on 1/31/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (strong, nonatomic) Deck *deck;
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) NSUInteger flipCount;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation CardGameViewController

- (Deck*) deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

/*
- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    for (UIButton *button in cardButtons) {
        Card *card = [self.deck drawRandomCard];
        [button setTitle: card.contents forState:UIControlStateSelected];
        
    }
}
 */

- (void)setFlipCount:(NSUInteger)flipCount {
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flip Count: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton*)sender {
    sender.selected = !sender.isSelected;
    if (sender.selected)
    {
        Card *card = [self.deck drawRandomCard];
        if ([card isKindOfClass:[PlayingCard class]]) {
            [sender setTitle: card.contents forState:UIControlStateSelected];
            self.flipCount++;
        }
    }
}
    
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
