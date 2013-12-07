//
//  PTLViewController.m
//  PTLViewDebugger
//
//  Created by Brian Partridge on 11/17/13.
//
//

#import "PTLViewController.h"
#import "UIView+PTLViewDebugger.h"

@interface PTLViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation PTLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Characters";
    self.items = @[@"Luke Skywalker", @"Han Solo", @"Chewbacca", @"Princess Leia", @"Obi-wan Kenobi", @"R2-D2", @"C-3P0"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.view ptl_showDebugBorder:YES];
    DLog([self.view ptl_recursiveDescription]);
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
