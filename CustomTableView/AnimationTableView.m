//
//  AnimationTableView.m
//  CustomTableView
//
//  Created by YiTie on 16/4/22.
//  Copyright © 2016年 武文杰. All rights reserved.
//

#import "AnimationTableView.h"
#import <QuartzCore/QuartzCore.h>

#define AnimationDuration 0.8

@interface AnimationTableView ()
{
    NSInteger _currentMaxDisplayedCell;
}
@end



@implementation AnimationTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentMaxDisplayedCell = 0;
    }
    return self;
}


- (void)customizeCell:(UITableViewCell *)cell
{
    CGFloat value = (90.0 * M_PI) / 180.0;
    CATransform3D rotate = CATransform3DMakeRotation(value, 0.0, 0.7, 0.4);
    rotate.m34 = 1.0 / -600;
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotate;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    if(cell.layer.position.x != 0){
        cell.layer.position = CGPointMake(0, cell.layer.position.y);
    }
    [UIView beginAnimations:@"rotate" context:nil];
    [UIView setAnimationDuration:AnimationDuration];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}


- (void)appearCell:(UITableViewCell *)cell andDirection:(Duration)direction andRow:(NSInteger)row
{
    
//    if (row <= _currentMaxDisplayedCell) {
//        return;
//    }
    
    NSInteger baseRows = ceilf(CGRectGetHeight(self.bounds) / self.rowHeight) - 1;
    
    CGFloat delay = row <= baseRows ? 0.05f * row : 0.01f;
    
    switch (direction) {
        case directionRight: {
            cell.layer.transform = CATransform3DMakeRotation(90.0f, 0, 1, 0);
            cell.layer.anchorPoint = CGPointMake(1, 0.5);
        }
            break;
        case directionLeft: {
            cell.layer.transform = CATransform3DMakeRotation(-90.0f, 0, 1, 0);
            cell.layer.anchorPoint = CGPointMake(0.0, 0.5);
        }
    }
    cell.alpha = 0;
    

    [UIView animateWithDuration:AnimationDuration
                          delay:delay
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         //clear the transform
                         cell.layer.transform = CATransform3DIdentity;
                          cell.alpha = 1;
                     } completion:nil];
    _currentMaxDisplayedCell = row;
}

- (void)appearCell:(UITableViewCell *)cell andDirection:(Duration)direction
{

    
    switch (direction) {
        case directionRight: {
            cell.layer.transform = CATransform3DMakeRotation(90.0f, 0, 1, 0);
            cell.layer.anchorPoint = CGPointMake(1, 0.5);
        }
            break;
        case directionLeft: {
            cell.layer.transform = CATransform3DMakeRotation(-90.0f, 0, 1, 0);
            cell.layer.anchorPoint = CGPointMake(0.0, 0.5);
        }
    }
    cell.alpha = 0;
    
    
    [UIView animateWithDuration:AnimationDuration
                          delay:0.05
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         //clear the transform
                         cell.layer.transform = CATransform3DIdentity;
                         cell.alpha = 1;
                     } completion:nil];
}

@end
