//
//  SESlideTableViewCell.h
//  slidetableviewcell
//
//  Created by letdown on 2014/07/09.
//  Copyright (c) 2014 Space Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SESlideTableViewCell;

typedef NS_ENUM(NSInteger, SESlideTableViewCellSlideState) {
	SESlideTableViewCellSlideStateCenter,
	SESlideTableViewCellSlideStateLeft,
	SESlideTableViewCellSlideStateRight,
};

typedef NS_ENUM(NSInteger, SESlideTableViewCellSide) {
	SESlideTableViewCellSideLeft,
	SESlideTableViewCellSideRight,
};

/**
 SESlideTableViewCellDelegate can be used to handle button triggers.
 */
@protocol SESlideTableViewCellDelegate <NSObject>
@optional
- (void)slideTableViewCell:(SESlideTableViewCell*)cell didTriggerLeftButton:(NSInteger)buttonIndex;
- (void)slideTableViewCell:(SESlideTableViewCell*)cell didTriggerRightButton:(NSInteger)buttonIndex;
- (BOOL)slideTableViewCell:(SESlideTableViewCell*)cell canSlideToState:(SESlideTableViewCellSlideState)slideState;
@end

/**
 SESlideTableViewCell is a subclass of UITableViewCell which shows utility buttons with sliding it.
 */
@interface SESlideTableViewCell : UITableViewCell

@property (nonatomic, weak) id<SESlideTableViewCellDelegate> delegate;
@property (nonatomic, readonly) SESlideTableViewCellSlideState slideState;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)addButton:(UIView*)button buttonWidth:(CGFloat)buttonWidth backgroundColor:(UIColor*)backgroundColor side:(SESlideTableViewCellSide)side;

- (void)removeAllButtonsWithSide:(SESlideTableViewCellSide)side;

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

- (void)addButtonWithText:(NSString*)text textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor side:(SESlideTableViewCellSide)side;

- (void)addButtonWithImage:(UIImage*)image backgroundColor:(UIColor*)backgroundColor side:(SESlideTableViewCellSide)side;

- (void)addLeftButtonWithText:(NSString*)text textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor;
- (void)addRightButtonWithText:(NSString*)text textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor;
- (void)addLeftButtonWithImage:(UIImage*)image backgroundColor:(UIColor*)backgroundColor;
- (void)addRightButtonWithImage:(UIImage*)image backgroundColor:(UIColor*)backgroundColor;

@end
