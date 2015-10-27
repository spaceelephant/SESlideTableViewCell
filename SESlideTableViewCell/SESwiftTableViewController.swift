//
//  SESwiftTableViewController.swift
//  slidetableviewcell
//
//  Created by letdown on 2014/07/15.
//  Copyright (c) 2014 Space Elephant. All rights reserved.
//

import UIKit

enum CellIndex : Int {
	case RightButtons
	case RightButtonsAndDisclosureIndicator
	case RightLongButtons
	case ThreeRightButtons
	case RightImageButton
	case LeftRightButtons
	case LeftButtons
	case BackgroundColor
	case ContentUpdate
	
	case Count
}

class SESwiftTableViewController: UITableViewController, SESlideTableViewCellDelegate {
	
	var collation: UILocalizedIndexedCollation?
	var rightButtonDisabled: Bool = false
	var leftButtonDisabled: Bool = false
	var value: Int = 0
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let button = UIBarButtonItem(title: "Index", style: .Plain, target:self, action: "indexButtonDidTap:")
		navigationItem.rightBarButtonItem = button
		
		let segmentedControl = UISegmentedControl(items: ["L" as NSString, "R" as NSString])
		segmentedControl.momentary = true
		segmentedControl.addTarget(self, action: "toggleLeftAndRightButtons:", forControlEvents: .ValueChanged)
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: segmentedControl)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		if collation != nil {
			return collation!.sectionIndexTitles.count
		} else {
			return 1
		}

	}

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return CellIndex.Count.rawValue
	}
	
	override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
		if collation != nil {
			return collation!.sectionForSectionIndexTitleAtIndex(index)
		}
		return index
	}
	
	override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
		return collation?.sectionIndexTitles
	}
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if collation != nil {
			return collation!.sectionTitles[section]
		}
		return nil
	}
	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cellIndex = CellIndex(rawValue: indexPath.row)
		switch cellIndex! {
		case .RightButtons:
			let CELL_ID = "Cell0"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				
				cell!.textLabel!.text = "Cell with Right Buttons"
				cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addRightButtonWithText("World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			}
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		case .RightButtonsAndDisclosureIndicator:
			let CELL_ID = "Cell1"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				
				cell!.textLabel!.text = "Cell with Right Buttons and Disclosure Indicator"
				cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addRightButtonWithText("World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.accessoryType = .DisclosureIndicator
			}
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		case .RightLongButtons:
			let CELL_ID = "Cell2"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				
				cell!.textLabel!.text = "Cell with Right Buttons"
				cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addRightButtonWithText("World with Love", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			}
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		case .ThreeRightButtons:
			let CELL_ID = "Cell3"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				
				cell!.textLabel!.text = "Cell with three Right Buttons"
				cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addRightButtonWithText("World", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addRightButtonWithText("Again", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 120.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			}
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		case .RightImageButton:
			let CELL_ID = "Cell4"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				
				cell!.textLabel!.text = "Cell with a Right Image Button"
				cell!.addRightButtonWithImage(UIImage(named: "image-cloud"), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			}
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		case .LeftRightButtons:
			let CELL_ID = "Cell5"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				
				cell!.textLabel!.text = "Cell with Left and Right Buttons"
				cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addRightButtonWithText("Right World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addLeftButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addLeftButtonWithText("Left World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			}
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		case .LeftButtons:
			let CELL_ID = "Cell6"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				
				cell!.textLabel!.text = "Cell with Left Buttons"
				cell!.addLeftButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addLeftButtonWithText("World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.accessoryType = .DisclosureIndicator
			}
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		case .BackgroundColor:
			let CELL_ID = "Cell7"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				let bgColor = UIColor(hue: 210/360.0, saturation: 0.1, brightness: 0.9, alpha: 1.0)
				cell!.backgroundColor = bgColor
				cell!.slideBackgroundColor = bgColor
				cell!.indicatorColor = UIColor(hue: 12/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0)
				
				cell!.textLabel!.text = "Cell with Background Color"
				cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addRightButtonWithText("World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			}
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		case .ContentUpdate:
			let CELL_ID = "Cell8"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
				cell!.delegate = self
				cell!.addRightButtonWithText("-", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
				cell!.addRightButtonWithText("+", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			}
			configureCell(cell, atIndex: indexPath.row)
			
			cell!.showsLeftSlideIndicator = !leftButtonDisabled
			cell!.showsRightSlideIndicator = !rightButtonDisabled
			return cell!
		default:
			let CELL_ID = "Cell"
			var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
			if cell == nil {
				cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
				cell!.selectionStyle = .None
			}
			return cell!
		}
    }

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell = tableView.cellForRowAtIndexPath(indexPath) as! SESlideTableViewCell!
		switch cell.slideState {
		case .Center:
			cell.setSlideState(.Right, animated:true)
		default:
			cell.setSlideState(.Center, animated:true)
		}
	}

	// #pragma mark -
	
	func slideTableViewCell(cell: SESlideTableViewCell!, didTriggerLeftButton buttonIndex: NSInteger) {
		let indexPath = tableView.indexPathForCell(cell)
		print("left button \(buttonIndex) tapped in cell \(indexPath?.section) - \(indexPath?.row)")
	}
	
	func slideTableViewCell(cell: SESlideTableViewCell!, didTriggerRightButton buttonIndex: NSInteger) {
		let indexPath = tableView.indexPathForCell(cell)
		print("right button \(buttonIndex) tapped in cell \(indexPath?.section) - \(indexPath?.row)")
		if indexPath?.row == CellIndex.ContentUpdate.rawValue {
			switch buttonIndex {
			case 0:
				value--
			case 1:
				value++
			default:
				break
			}
			self.configureCell(cell, atIndex: indexPath!.row)
			cell.updateContentViewSnapshot()
		}
	}
	
	func slideTableViewCell(cell: SESlideTableViewCell!, canSlideToState slideState: SESlideTableViewCellSlideState) -> Bool {
		switch (slideState) {
		case .Left:
			return !leftButtonDisabled
		case .Right:
			return !rightButtonDisabled
		default:
			break
		}
		return true
	}
	
	func slideTableViewCell(cell: SESlideTableViewCell!, didSlideToState slideState: SESlideTableViewCellSlideState) {
		if let indexPath = tableView.indexPathForCell(cell) {
			print("cell at \(indexPath.section) - \(indexPath.row) did slide to state \(slideState.rawValue)")
		}
	}
	
	func slideTableViewCell(cell: SESlideTableViewCell!, wilShowButtonsOfSide side: SESlideTableViewCellSide) {
		if let indexPath = tableView.indexPathForCell(cell) {
			print("cell at \(indexPath.section) - \(indexPath.row) will show buttons of side \(side.rawValue)")
		}
	}
	
	func configureCell(cell: SESlideTableViewCell!, atIndex index:Int) {
		if index == CellIndex.ContentUpdate.rawValue {
			cell.textLabel?.text = "Cell with value \(value)"
		}
	}
	// #pragma mark -
	
	func indexButtonDidTap(sender: AnyObject!) {
		if collation != nil {
			collation = nil
		} else {
			collation = UILocalizedIndexedCollation.currentCollation()
		}
		tableView.reloadData()
	}
	
	func toggleLeftAndRightButtons(sender: UISegmentedControl!) {
		switch (sender.selectedSegmentIndex) {
		case 0:
			leftButtonDisabled = !leftButtonDisabled
			self.tableView.reloadData()
			let message = leftButtonDisabled ? "Disabled" : "Enabled"
			let alertView = UIAlertView(title: "Left Button", message: message, delegate: nil, cancelButtonTitle: "OK")
			alertView.show()
		case 1:
			rightButtonDisabled = !rightButtonDisabled
			self.tableView.reloadData()
			let message = rightButtonDisabled ? "Disabled" : "Enabled"
			let alertView = UIAlertView(title: "Right Button", message: message, delegate: nil, cancelButtonTitle: "OK")
			alertView.show()
		default:
			break
		}
	}
}
