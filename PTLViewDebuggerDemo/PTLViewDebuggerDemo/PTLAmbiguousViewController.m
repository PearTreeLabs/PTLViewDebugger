//
//  PTLAmbiguousViewController.m
//  PTLViewDebugger
//
//  Created by Brian Partridge on 1/1/14.
//
//

#import "PTLAmbiguousViewController.h"
#import "PTLViewDebugger.h"

@interface PTLAmbiguousViewController ()

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *stopButton;

@end

@implementation PTLAmbiguousViewController

- (id)init {
	self = [super init];
	if (self) {
        self.tabBarItem.title = @"Auto Layout";
	}

	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.view.tintColor = [UIColor whiteColor];

    self.startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.startButton setBackgroundColor:[UIColor greenColor]];
    [self.startButton addTarget:self action:@selector(startTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.startButton];

    self.stopButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    [self.stopButton setBackgroundColor:[UIColor redColor]];
    [self.stopButton addTarget:self action:@selector(stopTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.stopButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.stopButton];

    NSDictionary *views = @{ @"start" : self.startButton,
                             @"stop" : self.stopButton };
    // This is ambiguous because we're saying we want the standard distance between each button and the superview, but each button will only be as wide as they need to be.
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[start]-[stop]-|"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[start]"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:views]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.view ptl_identifyViewsWithAmbiguousLayout];
}

- (void)startTapped:(id)sender {
    [self.view ptl_startAutoLayoutDance:YES];
}

- (void)stopTapped:(id)sender {
    [self.view ptl_stopAutoLayoutDance:YES];
}

@end
