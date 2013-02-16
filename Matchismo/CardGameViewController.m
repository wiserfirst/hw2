//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Wu Qing on 1/31/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "GameResult.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) NSUInteger flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UISwitch *modeSwitch;
@property (nonatomic, getter = isThreeCardMode) BOOL threeCardMode;
@property (strong, nonatomic) GameResult *gameResult;

@end

@implementation CardGameViewController

- (GameResult*)gameResult
{
    if (!_gameResult) {
        _gameResult = [[GameResult alloc] init];
    }
    return _gameResult;
}

- (CardMatchingGame*)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc]
                 initWithCardCount:[self.cardButtons count]
                 usingDeck:[[PlayingCardDeck alloc] init]
                 withMatchNumber:self.isThreeCardMode ? 3 : 2];
    }
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
    NSLog(self.isThreeCardMode ? @"Three" : @"Two");
}

- (void)updateUI
{
    UIImage *cardBackImage = [UIImage imageNamed:@"pokerback.png"];
    //NSLog([NSString stringWithFormat:@" %f ", cardBackImage.size.height]);
    UIImage *cardFrontImage = [[UIImage alloc] init];
    for(UIButton *cardButton in self.cardButtons)
    {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        cardButton.selected = card.isFaceUp;
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.imageEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 2);
        [cardButton setImage:cardBackImage forState:UIControlStateNormal];
        [cardButton setImage:cardFrontImage forState:UIControlStateSelected];
        [cardButton setImage:cardFrontImage forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (void)updateStatusLabel: (NSString*)text
{
    self.statusLabel.text = text;
}

- (void)setFlipCount:(NSUInteger)flipCount {
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    self.gameResult.score = self.game.score;
}

- (IBAction)flipCard:(UIButton*)sender {
    if (self.modeSwitch.isUserInteractionEnabled) {
        self.modeSwitch.UserInteractionEnabled = NO;
        self.modeSwitch.alpha = 0.5;
    }
    NSString *labelText = [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
    [self updateStatusLabel:labelText];
    //NSLog(self.isThreeCardMode ? @"Three" : @"Two");
}
    
- (void)viewDidLoad
{
    [super viewDidLoad];
	// set mode switch status
    self.modeSwitch.on = self.isThreeCardMode;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dealButton:(UIButton *)sender {
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    self.modeSwitch.UserInteractionEnabled = YES;
    self.modeSwitch.alpha = 1;
    [self updateUI];
    [self updateStatusLabel:@"Restarted!"];
    NSLog(self.isThreeCardMode ? @"Three" : @"Two");
}

- (IBAction)switchMatchingMode:(UISwitch *)sender {
    self.threeCardMode = sender.isOn;
    self.game = nil;
}

@end
