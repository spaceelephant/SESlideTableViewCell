//
//  SESlideTableViewCell.h
//  slidetableviewcell
//
//  Created by letdown on 2014/07/09.
//  Copyright (c) 2014 Space Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SESlideTableViewCell;

/**
 A state of SESlideTableViewCell that tells the buttons of which side are displayed.
 */
typedef NS_ENUM(NSInteger, SESlideTableViewCellSlideState) {
	/**
	 The cell shows no button.
	 */
	SESlideTableViewCellSlideStateCenter,
	/**
	 The cell shows the buttons of the left side.
	 */
	SESlideTableViewCellSlideStateLeft,
	/**
	 The cell shows the buttons of the right side.
	 */
	SESlideTableViewCellSlideStateRight,
};

/**
 A side of SESlideTableViewCell.
 */
typedef NS_ENUM(NSInteger, SESlideTableViewCellSide) {
	SESlideTableViewCellSideLeft,
	SESlideTableViewCellSideRight,
};

/**
 SESlideTableViewCellDelegate can be used to handle button triggers.
 */
@protocol SESlideTableViewCellDelegate <NSObject>
@optional
/**
 Tells the delegate that a button of the left side is triggered.
 
 @param cell The cell informing the delegate of the event.
 @param buttonIndex The index of the button which is triggered.
 */
- (void)slideTableViewCell:(SESlideTableViewCell*)cell didTriggerLeftButton:(NSInteger)buttonIndex;
/**
 Tells the delegate that a button of the right side is triggered.
 
 @param cell The cell informing the delegate of the event.
 @param buttonIndex The index of the button which is triggered.
 */
- (void)slideTableViewCell:(SESlideTableViewCell*)cell didTriggerRightButton:(NSInteger)buttonIndex;
/**
 Asks the delegate if the cell can be a slide-state.
 
 The result of this function is not reflected to the slide indicators of the cell.
 You should set "showsLeftSlideIndicator" or "showsRightSlideIndicator" property of SESlideTableViewCell manually.
 
 @return YES if the cell can be the state, otherwise NO.
 @param cell The cell that is making this request.
 @param slideState The state that the cell want to be.
 */
- (BOOL)slideTableViewCell:(SESlideTableViewCell*)cell canSlideToState:(SESlideTableViewCellSlideState)slideState;
@end

/**
 SESlideTableViewCell is a subclass of UITableViewCell which shows utility buttons with sliding it.
 
 SESlideTableViewCell class itself has only core interfaces.
 It is easy to use SESlideTableViewCell (ButtonUtility) extension.
 Or you can create your own convenient extensions with this core interfaces.
 */
@interface SESlideTableViewCell : UITableViewCell

@property (nonatomic, weak) id<SESlideTableViewCellDelegate> delegate;
@property (nonatomic, readonly) SESlideTableViewCellSlideState slideState;
/**
 A Boolean value that indicates whether the cell displays a left slide indicator.
 
 A slide indicator shows which way you can swipe the cell.
 The default value is YES.
 */
@property (nonatomic) BOOL showsLeftSlideIndicator;

/**
 A Boolean value that indicates whether the cell displays a right slide indicator.
 
 A slide indicator shows which way you can swipe the cell.
 The default value is YES.
 */
@property (nonatomic) BOOL showsRightSlideIndicator;

/**
 A color of the indicator
 */
@property (nonatomic) UIColor* indicatorColor;

/**
 A background color for the cell when it slides.
 
 If the background color of the cell is transparent, this color will be displayed as its background.
 */
@property (nonatomic) UIColor* slideBackgroundColor;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

/**
 Adds a button to the cell.
 
 the button view is stretched to fit the height of the cell and the width of the button.
 
 @param button A view that is shown as a button.
 @param buttonWidth The width of the button
 @param backgroundColor The color of the background of the button.
 @param side A side which the button is added to.
 */
- (void)addButton:(UIView*)button buttonWidth:(CGFloat)buttonWidth backgroundColor:(UIColor*)backgroundColor side:(SESlideTableViewCellSide)side;

/**
 Removes all the buttons of the left or right side.
 
 @param side A side the buttons of which will be removed.
 */
- (void)removeAllButtonsWithSide:(SESlideTableViewCellSide)side;

/**
 Set the cell to the slide-state.
 
 @param slideState A state to which the cell is made to be.
 @param animated YES if the state change is happened with animation, otherwise NO.
 */
- (void)setSlideState:(SESlideTableViewCellSlideState)slideState animated:(BOOL)animated;

@end

/**
 Extensions to add various types of buttons
 */
@interface SESlideTableViewCell (ButtonUtility)

- (void)addLeftButton:(UIView*)button buttonWidth:(CGFloat)buttonWidth backgroundColor:(UIColor*)backgroundColor;
- (void)addRightButton:(UIView*)button buttonWidth:(CGFloat)buttonWidth backgroundColor:(UIColor*)backgroundColor;
- (void)removeAllLeftButtons;
- (void)removeAllRightButtons;

/**
 Adds a text button. The width of the button is automatically set by its text length.
 
 @param text A text of button.
 @param textColor A color of text.
 @param backgroundColor A color of background of the button.
 @param side A side where the button is added.
 */
- (void)addButtonWithText:(NSString*)text textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor side:(SESlideTableViewCellSide)side;

/**
 Adds an image button.
 
 The width of the button is automatically set by its image width.
 The height of the image must be fit in the height of the cell.
 
 @param image A image of the button.
 @param backgroundColor A color of background of the button.
 @param side A side where the button is added.
 */
- (void)addButtonWithImage:(UIImage*)image backgroundColor:(UIColor*)backgroundColor side:(SESlideTableViewCellSide)side;

/**
 Adds a text button to the left side.
 
 @param text a text of the button.
 @param textColor a color of text of the button.
 @param backgroundColor a color of the background of the button
 */
- (void)addLeftButtonWithText:(NSString*)text textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor;

/**
 Adds a text button to the right side.
 
 @param text a text of the button.
 @param textColor a color of text of the button.
 @param backgroundColor a color of the background of the button
 */
- (void)addRightButtonWithText:(NSString*)text textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor;

/**
 Adds an image button to the left side.
 
 The width of the button is automatically set by its image width.
 The height of the image must be fit in the height of the cell.
 
 @param image A image of the button.
 @param backgroundColor A color of background of the button.
 */
- (void)addLeftButtonWithImage:(UIImage*)image backgroundColor:(UIColor*)backgroundColor;
/**
 Adds an image button to the right side.
 
 The width of the button is automatically set by its image width.
 The height of the image must be fit in the height of the cell.
 
 @param image A image of the button.
 @param backgroundColor A color of background of the button.
 */
- (void)addRightButtonWithImage:(UIImage*)image backgroundColor:(UIColor*)backgroundColor;

@end
