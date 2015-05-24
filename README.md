SESlideTableViewCell
====================

<p align="center"><img src="http://i.imgur.com/395rqmq.gif"/></p>

A subclass of UITableViewCell that shows buttons with swiping it.

## Features
* Portable. Made up with only one header and one source file.
* Indicator that shows which way you can swipe.
* Ready for iOS 8.
* Supports Swift language.

## Requirements

SESlideTableViewCell runs on iOS 7 and later.
It also works iOS 8 and it can be used in Swift language.

## How to Set up

Use CocoaPods to set up SESlideTableViewCell.
```
platform :ios, "7.0"
pod 'SESlideTableViewCell'
```

See http://cocoapods.org/ for more information about CocoaPods.

## Getting Started with Objective-C

You can create a SESlideTableViewCell in your UITableViewController like this.
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
## Getting Started with Swift

You can create a SESlideTableViewCell in your UITableViewController like this.
```swift
override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
	let CELL_ID = "Cell"
	var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
	if !cell {
		cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
		cell!.delegate = self
		cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
		cell!.addRightButtonWithText("World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
	}
	
    return cell
}
```
You can know which button is triggered with a SESlideTableViewCellDelegate method.
```swift
func slideTableViewCell(cell: SESlideTableViewCell!, didTriggerRightButton buttonIndex: NSInteger) {
	let indexPath = tableView.indexPathForCell(cell)
	println("right button \(buttonIndex) tapped in cell \(indexPath.section) - \(indexPath.row)")
}
```

# License

MIT license.

# Limitations

The animation of the contents in the cell stops while buttons are displayed.
This comes from using snapshot to display the existing content in the cell.

# Aknowledgement

Thank you for your contribution.
- @ihomam
