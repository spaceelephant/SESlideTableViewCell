SESlideTableViewCell
====================

<p align="center"><img src="http://i.imgur.com/NUJ9Hts.gif"/></p>
<p align="center"><img src="http://i.imgur.com/ic1fwxp.gif"/></p>

A subclass of UITableViewCell that shows buttons with swiping it.

## Features
* Portable. Only one header and one source file are included.
* Supports Swift language.

## Requirements

This supports iOS 7 and later.
It also works iOS 8 and it can be used in Swift language.

## How to Set up

Use CocoaPods to set up SESlideTableViewCell.
```
platform :ios, "7.0"
pod 'SESlideTableViewCell'
```

See http://cocoapods.org/ for more information about CocoaPods.

## Getting Started

You can setup your SESlideTableViewCell in your UITableViewController like this.
```objc
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString * const CELL_ID = @"Cell";
	SESlideTableViewCell* cell = (SESlideTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
	if (!cell) {
		cell = [[SESlideTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
		cell.delegate = self;
		[cell addRightButtonWithText:@"Hello" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:0.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
		[cell addRightButtonWithText:@"World!!" textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithHue:180.0/360.0 saturation:0.8 brightness:0.9 alpha:1.0]];
	}
	return cell;
}
```

You can know which button is triggered with a SESlideTableViewCellDelegate method.
```objc
- (void)slideTableViewCell:(SESlideTableViewCell*)cell didTriggerRightButton:(NSInteger)buttonIndex {
	NSLog(@"right button triggered:%d", (int)buttonIndex);
}
```
# License

MIT license.
