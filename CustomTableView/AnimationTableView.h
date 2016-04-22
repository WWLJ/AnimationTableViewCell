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



- (void)appearCell:(UITableViewCell *)cell andDirection:(Duration)direction;

@end
