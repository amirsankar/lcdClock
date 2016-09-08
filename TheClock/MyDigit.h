//
//  MyDigit.h
//  TheClock
//
//  Created by amir sankar on 4/25/16.
//  Copyright © 2016 amir sankar. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyDigit : UIView
@property (nonatomic, strong) UIView * view;
@property (weak, nonatomic) IBOutlet UIView *Top;
@property (weak, nonatomic) IBOutlet UIView *Middle;
@property (weak, nonatomic) IBOutlet UIView *Bottom;
@property (weak, nonatomic) IBOutlet UIView *TopRight;
@property (weak, nonatomic) IBOutlet UIView *BottomRight;
@property (weak, nonatomic) IBOutlet UIView *TopLeft;
@property (weak, nonatomic) IBOutlet UIView *BottomLeft;
@property (weak, nonatomic) IBOutlet UIView *SecondView;
-(void)showDigit:(long)digit;
-(void)setColor: (UIColor *)digitColor;


@end
