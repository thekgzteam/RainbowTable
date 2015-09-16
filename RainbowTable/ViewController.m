//
//  ViewController.m
//  RainbowTable
//
//  Created by Edil Ashimov on 7/20/15.
//  Copyright (c) 2015 Edil Ashimov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *rainbowTable;
@property NSMutableArray *colors;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colors = [NSMutableArray arrayWithObjects:[UIColor redColor],
                   [UIColor purpleColor],
                   [UIColor yellowColor],
                   [UIColor blackColor],
                   [UIColor grayColor],
                   [UIColor greenColor],
                   [UIColor blueColor],
                   nil];
}
- (IBAction)onAddRandomColor:(id)sender {
    NSLog(@"ADDING");
    CGFloat red = (float)rand() / RAND_MAX;
    CGFloat green = (float)rand() / RAND_MAX;
    CGFloat blue = (float)rand() / RAND_MAX;

    UIColor *newcolor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    [self.colors addObject:newcolor];
    [self.rainbowTable reloadData];
}

#pragma mark UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.colors.count;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = [NSString stringWithFormat:@"row %li", (long) indexPath.row];
    cell.backgroundColor = [self.colors objectAtIndex:indexPath.row];
    return cell;
}
@end
