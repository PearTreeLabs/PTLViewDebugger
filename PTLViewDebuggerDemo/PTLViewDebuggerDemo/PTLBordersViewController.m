//
//  PTLViewController.m
//  PTLViewDebugger
//
//  Created by Brian Partridge on 11/17/13.
//
//

#import "PTLBordersViewController.h"
#import "PTLViewDebugger.h"

@interface PTLBordersViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation PTLBordersViewController

- (id)init {
	self = [super init];
	if (self) {
        self.title = @"Borders";
	}

	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.items = @[@"Luke Skywalker", @"Han Solo", @"Chewbacca", @"Princess Leia", @"Obi-wan Kenobi", @"R2-D2", @"C-3P0"];

    UISwitch *sw = [[UISwitch alloc] init];
    sw.on = NO;
    [sw addTarget:self action:@selector(switchToggled:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:sw];
    self.navigationItem.rightBarButtonItem = barItem;
}

#pragma mark - User Interaction

- (void)switchToggled:(UISwitch *)sw {
    if (sw.isOn) {
        [self.view ptl_identifyViewLayout];
    } else {
        [self.view ptl_hideAllDebugBorders];
    }

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    NSLog(@"%@", [self.view performSelector:@selector(recursiveDescription)]);
#pragma clang diagnostic pop
}

#pragma mark - UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.items[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
