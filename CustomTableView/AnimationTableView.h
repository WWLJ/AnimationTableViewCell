//
//  AnimationTableView.h
//  CustomTableView
//
//  Created by YiTie on 16/4/22.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, Direction) {
    directionRight,
    directionLeft
};
@interface AnimationTableView : UITableView
/**
 *  旋转出现的cell
 *
 *  @param cell 进行的cell
 */
- (void)customizeCell:(UITableViewCell *)cell;
/**
 *  cell从右面过来的动画
 *
 *  @param cell      进行的cell
 *  @param direction 方向
 *  @param row       当前行
 */
- (void)appearCell:(UITableViewCell *)cell andDirection:(Duration)direction andRow:(NSInteger)row;


/**
 *  旋转出现的cell
 *
 *  @param cell      当前cell
 *  @param direction 旋转的方向(逆时针或者顺时针)
 */
- (void)appearCell:(UITableViewCell *)cell andDirection:(Duration)direction;



/**
 *  由小变大的cell动画
 *
 *  @param cell  当前cell
 *  @param scale 缩小比例
 */
- (void)appearCell:(UITableViewCell *)cell andScale:(CGFloat)scale;


@end
