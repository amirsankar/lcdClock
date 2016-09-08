//
//  ViewController.h
//  TheClock
//
//  Created by amir sankar on 4/25/16.
//  Copyright © 2016 amir sankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDigit.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MyDigit *myDigit1;
@property (weak, nonatomic) IBOutlet MyDigit *myDigit2;
@property (weak, nonatomic) IBOutlet MyDigit *myDigit3;
@property (weak, nonatomic) IBOutlet MyDigit *myDigit4;
@property (weak, nonatomic) IBOutlet UIView *FirstDot;
@property (weak, nonatomic) IBOutlet UIView *SecondDot;
@property (weak, nonatomic) IBOutlet UILabel *ampm;
@property (strong, nonatomic) IBOutlet UIView *largeView;
@property (weak, nonatomic) IBOutlet UIView *smallView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundColor2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *digitColor2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeType2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *timeZone2;
@property (nonatomic, assign) NSInteger backgroundSegment;
@property (nonatomic, assign) NSInteger digitSegment;
@property (nonatomic, assign) NSInteger timeTypeSegment;
@property (nonatomic, assign) NSInteger timeZoneSegment;
@property (assign) BOOL twelveHourTime;
@property (assign) BOOL PST;
@property (assign) BOOL hideAMPM;
- (IBAction)timeZone:(id)sender;
- (IBAction)digitColor:(id)sender;
- (IBAction)timeType:(id)sender;
- (IBAction)backroundColor:(id)sender;
-(void)timeMethod;
-(void)dotGone;
-(void)dotHere;
-(void)setBackgroundColor:(UIColor *)backgroundColor;
-(void)setDigitColor: (UIColor *)digitColor;
-(void)setExtrasColor:(UIColor *)extraColor;
-(void)saveTheData;
-(void)retrieveTheData;

@end

