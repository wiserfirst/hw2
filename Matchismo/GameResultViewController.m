//
//  GameResultViewController.m
//  Matchismo
//
//  Created by Wu Qing on 2/14/13.
//  Copyright (c) 2013 Wu Qing. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameResult.h"

@interface GameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;
@property (strong, nonatomic) NSArray *allGameResults;

@end

@implementation GameResultViewController

- (NSArray*)allGameResults
{
    if (!_allGameResults) {
        _allGameResults = [GameResult allGameResults];
    }
    return _allGameResults;
}

- (IBAction)sortByDate {
    NSArray *results = [[GameResult allGameResults] sortedArrayUsingSelector:@selector(dateCompare:)];
    self.allGameResults = results;
    [self updateUI];
}

- (IBAction)sortByScore {
    self.allGameResults = [[GameResult allGameResults] sortedArrayUsingSelector:@selector(scoreCompare:)];
    [self updateUI];
}

- (IBAction)sortByDuration {
    self.allGameResults = [[GameResult allGameResults] sortedArrayUsingSelector:@selector(durationCompare:)];
    [self updateUI];
}

- (void)updateUI
{
    NSString *displayText = @"";
    for (GameResult *result in self.allGameResults) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %0gs)\n", result.score, result.end, round(result.duration)];
    }
    self.display.text = displayText;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)setup
{
    // initialization that can't wait until viewDidLoad
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

@end
