//
//  UIView+PTLViewDebugger.h
//  PTLViewDebugger
//
//  Created by Brian Partridge on 11/17/13.
//
//

#import <UIKit/UIKit.h>

/**
 * Utility methods for debugging UIView layouts.
 */
@interface UIView (PTLViewDebugger_Colors)

/**
 * @return The minimum width (in points) of a line in the view's coordinate system on the current screen based on the screen's scale.
 */
- (CGFloat)ptl_minLineWidth;

/**
 * Adds a randomly colored border to the view.
 */
- (void)ptl_showDebugBorder;

/**
 * Adds a randomly colored border to the view and all subviews.
 */
- (void)ptl_showDebugBorder:(BOOL)trickleDown;

/**
 * Removes any previously set border on the view.
 */
- (void)ptl_hideDebugBorder;

/**
 * Removes any previously set border on the view and all subviews.
 */
- (void)ptl_hideDebugBorder:(BOOL)trickleDown;

/**
 * @return The default description for the view, styled with the currently shown debug border color.
 */
- (NSString *)ptl_description;

/**
 * @return The a string outlining the view hierarchy below of this view using ptl_description.
 */
- (NSString *)ptl_recursiveDescription;

@end

/**
 * Utility methods for debugging UIView's using autolayout.
 */
@interface UIView (PTLViewDebugger_AutoLayout)

/**
 * Starts repeatedly exercising ambiguity in the layout of the current view.
 */
- (void)ptl_startAutoLayoutDance;

/**
 * Starts repeatedly exercising ambiguity in the layout of the current view and (optionally) it's subviews.
 * @param includeSubviews traverses the view hierarchy downward enabling the dance on each descendant view.
 */
- (void)ptl_startAutoLayoutDance:(BOOL)includeSubviews;

/**
 * Stops any exercising of ambiguity in the layout of the current view.
 */
- (void)ptl_stopAutoLayoutDance;

/**
 * Stops any exercising of ambiguity in the layout of the current view and (optionally) it's subviews.
 * @param includeSubviews traverses the view hierarchy downward disabling the dance on each descendant view.
 */
- (void)ptl_stopAutoLayoutDance:(BOOL)includeSubviews;

@end