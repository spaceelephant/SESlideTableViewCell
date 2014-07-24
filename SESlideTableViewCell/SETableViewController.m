//
//  SETableViewController.m
//  slidetableviewcell
//
//  Created by letdown on 2014/07/09.
//  Copyright (c) 2014 Space Elephant. All rights reserved.
//

#import "SETableViewController.h"

#import "SESlideTableViewCell.h"

@interface SETableViewController () <SESlideTableViewCellDelegate> {
	UILocalizedIndexedCollation* m_collation;
}

@end

@implementation SETableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	{
		UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithTitle:@"Index" style:UIBarButtonItemStylePlain target:self action:@selector(indexButtonDidTap:)];
		self.navigationItem.rightBarButtonItem = button;
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if (m_collation) {
		return m_collation.sectionIndexTitles.count;
	}
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 7;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
	if (m_collation) {
		return [m_collation sectionForSectionIndexTitleAtIndex:index];
	}
	return index;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	if (m_collation) {
		return m_collation.sectionIndexTitles;
	}
	return nil;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (m_collation) {
		return m_collation.sectionIndexTitles[section];
	}
	return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString * const CELL_ID = @"Cell";
	SESlideTableViewCell* cell = (SESlideTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
	if (!cell) {
		cell = [[SESlideTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.delegate = self;
	}
	[cell removeAllLeftButtons];
	[cell removeAllRightButtons];
	
	cell.textLabel.text = [NSString stringWithFormat:@"Slide Cell for %d - %d", (int)indexPath.section, (int)indexPath.row];

	switch (indexPath.row) {
		case 0:
			cell.textLabel.text = @"Cell with Right Buttons";
			[cell addRightButtonWithText:@"Hello" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addRightButtonWithText:@"World!!" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:180.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			break;
		case 1:
			cell.textLabel.text = @"Cell with Right Buttons and Disclosure Indicator";
			[cell addRightButtonWithText:@"Hello" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addRightButtonWithText:@"World!!" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:180.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			break;
		case 2:
			cell.textLabel.text = @"Cell with Right Buttons";
			[cell addRightButtonWithText:@"Hello" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addRightButtonWithText:@"World with Love" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:180.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			break;
		case 3:
			cell.textLabel.text = @"Cell with three Right Buttons";
			[cell addRightButtonWithText:@"Hello" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addRightButtonWithText:@"World" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:180.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addRightButtonWithText:@"Again" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:120.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			break;
		case 4:
			cell.textLabel.text = @"Cell with a Right Image Button";
			[cell addRightButtonWithImage:[UIImage imageNamed:@"image-cloud"] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			break;
		case 5:
			cell.textLabel.text = @"Cell with Left Buttons";
			[cell addLeftButtonWithText:@"Hello" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addLeftButtonWithText:@"World!!" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:180.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			break;
		case 6:
			cell.textLabel.text = @"Cell with Left and Right Buttons";
			[cell addRightButtonWithText:@"Hello" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addRightButtonWithText:@"Right World!!" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:180.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addLeftButtonWithText:@"Hello" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			[cell addLeftButtonWithText:@"Left World!!" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:180.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
			break;
		default:
			break;
	}
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	SESlideTableViewCell* cell = (SESlideTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
	switch (cell.slideState) {
		case SESlideTableViewCellSlideStateCenter:
			[cell setSlideState:SESlideTableViewCellSlideStateRight animated:YES];
			break;
		default:
			[cell setSlideState:SESlideTableViewCellSlideStateCenter animated:YES];
			break;
	}
}

#pragma mark -

- (void)indexButtonDidTap:(id)sender {
	if (m_collation) {
		m_collation = nil;
	} else {
		m_collation = [UILocalizedIndexedCollation currentCollation];
	}
	[self.tableView reloadData];
}

#pragma mark - 

- (void)slideTableViewCell:(SESlideTableViewCell*)cell didTriggerLeftButton:(NSInteger)buttonIndex {
	NSLog(@"left button triggered:%d", (int)buttonIndex);
}

- (void)slideTableViewCell:(SESlideTableViewCell*)cell didTriggerRightButton:(NSInteger)buttonIndex {
	NSLog(@"right button triggered:%d", (int)buttonIndex);
}

@end
