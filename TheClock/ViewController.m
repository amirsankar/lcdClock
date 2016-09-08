//
//  ViewController.m
//  TheClock
//
//  Created by amir sankar on 4/25/16.
//  Copyright © 2016 amir sankar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(dotGone) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(dotHere) userInfo:nil
        repeats:YES];
    [self retrieveTheData];
    
    //timezone
    /*NSUserDefaults *timeZoneDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger timeZoneSegmentNumber = [timeZoneDefaults integerForKey:@"timeZoneSegment"];
    [self.timeZone2 setSelectedSegmentIndex:timeZoneSegmentNumber];
    [self timeZone:self.timeZone2];
    
    //timetype
    NSUserDefaults *timeTypeDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger timeTypeSegmentNumber = [timeTypeDefaults integerForKey:@"timeTypeSegment"];
    [self.timeType2 setSelectedSegmentIndex:timeTypeSegmentNumber];
    [self timeType:self.timeType2];
    
   //background Color
    NSUserDefaults *backgroundDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger backgroundSegmentNumber = [backgroundDefaults integerForKey:@"backgroundSegment"];
    NSData *backgroundColorData1 = [backgroundDefaults objectForKey:@"backgroundColor"];
    UIColor *backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:backgroundColorData1];
    [self setBackgroundColor:backgroundColor];
    [self.backgroundColor2 setSelectedSegmentIndex:backgroundSegmentNumber];

    //digit color
    NSUserDefaults *digitsDefaults = [NSUserDefaults standardUserDefaults];
    NSData *digitColorData1 = [digitsDefaults objectForKey:@"digitColorData"];
    NSInteger digitSegmentNumber = [digitsDefaults integerForKey:@"digitSegment"];
    UIColor *dColor1 = [NSKeyedUnarchiver unarchiveObjectWithData:digitColorData1];
    [self setDigitColor:digitColor1];
    self.FirstDot.backgroundColor = dColor1;
    self.SecondDot.backgroundColor = dColor1;
    self.ampm.textColor = dColor1;
    [self.digitColor2 setSelectedSegmentIndex:digitSegmentNumber];*/
    [super viewDidLoad];
}

- (IBAction)digitColor:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    self.digitSegment = segmentedControl.selectedSegmentIndex;
    
    switch (selectedSegment){
            
            case 0:
            [self setDigitColor: [UIColor redColor]];
            [self setExtrasColor:[UIColor redColor]];
            break;
            
            case 1:
            [self setDigitColor: [UIColor orangeColor]];
            [self setExtrasColor:[UIColor orangeColor]];
            break;
            
            case 2:
            [self setDigitColor: [UIColor greenColor]];
            [self setExtrasColor:[UIColor greenColor]];
            break;
            
            case 3:
            [self setDigitColor:[UIColor yellowColor]];
            [self setExtrasColor:[UIColor yellowColor]];
            break;
    }
    
    /*NSUserDefaults *digitsDefaults = [NSUserDefaults standardUserDefaults];
    NSData *digitColorData = [NSKeyedArchiver archivedDataWithRootObject:_myDigit1.Top.backgroundColor];
    
    [digitsDefaults setObject:digitColorData forKey:@"digitColorData"];
    [digitsDefaults setInteger:self.digitSegment forKey:@"digitSegment"];
    [digitsDefaults synchronize];*/
    
    [self saveTheData];
}

- (IBAction)backroundColor:(id)sender{
   UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
   NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    self.backgroundSegment = segmentedControl.selectedSegmentIndex;
    
    switch (selectedSegment) {
            
        case 0:
            [self setBackgroundColor:UIColorFromRGB(0X6DD7FF)];
            break;
            
        case 1:
            [self setBackgroundColor:[UIColor blueColor]];
            break;
            
        case 2:
            [self setBackgroundColor:[UIColor lightGrayColor]];
            break;
            
        case 3:
            [self setBackgroundColor:[UIColor magentaColor]];
            break;
    }
    
    /*NSUserDefaults *backgroundDefaults = [NSUserDefaults standardUserDefaults];
    NSData *backgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:self.largeView.backgroundColor];
    
    [backgroundDefaults setObject:backgroundColorData forKey:@"backgroundColor"];
    [backgroundDefaults setInteger:self.backgroundSegment forKey:@"backgroundSegment"];
          [backgroundDefaults synchronize];*/
    [self saveTheData];
}

- (IBAction)timeType:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    self.timeTypeSegment = segmentedControl.selectedSegmentIndex;
    
    switch (selectedSegment) {
        case 0:
            _twelveHourTime = NO;
            break;
            
        case 1:
            _twelveHourTime = YES;
            break;
    }
    
    /*NSUserDefaults *timeTypeDefaults = [NSUserDefaults standardUserDefaults];
    [timeTypeDefaults setInteger:self.timeTypeSegment forKey:@"timeTypeSegment"];
    [timeTypeDefaults synchronize];*/
    
    [self saveTheData];
}

- (IBAction)timeZone:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    self.timeZoneSegment = segmentedControl.selectedSegmentIndex;
    
    switch (selectedSegment){
            case 0:
            self.PST = NO;
            break;
            
            case 1:
            self.PST = YES;
            break;
    }
    
   /* NSUserDefaults *timeZoneDefaults = [NSUserDefaults standardUserDefaults];
    [timeZoneDefaults setInteger:self.timeZoneSegment forKey:@"timeZoneSegment"];
    [timeZoneDefaults synchronize];*/
    [self saveTheData];
}

-(void)timeMethod{
    NSString *theZone;
    if (self.PST == YES) {
        theZone = @"PST";
    } else{
        theZone = @"EST";
    }
    
    NSDate *now = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setTimeZone: [NSTimeZone timeZoneWithAbbreviation:theZone]];
    NSDateComponents *components = [gregorian components: (NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:now];
    
    NSInteger hours = components.hour;
    NSInteger minutes = components.minute;
    
    if (self.twelveHourTime == YES) {
        [self.ampm setHidden:FALSE];
        if (hours == 12) {
            
        } else if (hours < 12){
            self.ampm.text = @"AM";
        } else {
            self.ampm.text = @"PM";
            hours -= 12;
        }

    } else {
        [self.ampm setHidden:TRUE];
    }
    
    NSInteger hoursTensDigit = hours/10;
    NSInteger hoursOnesDigit = hours%10;
    NSInteger minutesTenDigit = minutes/10;
    NSInteger minutesOnesDigit = minutes%10;
    
    [self.myDigit1 showDigit:hoursTensDigit];
    [self.myDigit2 showDigit:hoursOnesDigit];
    [self.myDigit3 showDigit:minutesTenDigit];
    [self.myDigit4 showDigit:minutesOnesDigit];
}

-(void)setBackgroundColor:(UIColor *)backgroundColor{
    self.largeView.backgroundColor = backgroundColor;
    self.smallView.backgroundColor = backgroundColor;
    self.myDigit1.SecondView.backgroundColor = backgroundColor;
    self.myDigit2.SecondView.backgroundColor = backgroundColor;
    self.myDigit3.SecondView.backgroundColor = backgroundColor;
    self.myDigit4.SecondView.backgroundColor = backgroundColor;
}

-(void)setDigitColor: (UIColor *)digitColor{
    [self.myDigit1 setColor:digitColor];
    [self.myDigit2 setColor:digitColor];
    [self.myDigit3 setColor:digitColor];
    [self.myDigit4 setColor:digitColor];
}

-(void)dotGone{
    self.FirstDot.hidden = YES;
    self.SecondDot.hidden = YES;
}

-(void)dotHere{
    self.FirstDot.hidden = NO;
    self.SecondDot.hidden = NO;
}

-(void)setExtrasColor:(UIColor *)extraColor{
    self.FirstDot.backgroundColor = extraColor;
    self.SecondDot.backgroundColor = extraColor;
    self.ampm.textColor = extraColor;
}

-(void)saveTheData{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"myPlist.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSMutableDictionary *data;
    
    if ([fileManager fileExistsAtPath:path]) {
        data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    } else {
        data = [[NSMutableDictionary alloc]init];
    }
    
    NSData *backgroundColorData = [NSKeyedArchiver archivedDataWithRootObject:self.largeView.backgroundColor];
    NSData *digitColorData = [NSKeyedArchiver archivedDataWithRootObject:_myDigit1.Top.backgroundColor];
    NSNumber *digitSegmentData = [NSNumber numberWithInteger: self.digitSegment];
    NSNumber *backgroundSegmentData = [NSNumber numberWithInteger: self.backgroundSegment];
    NSNumber *timeZoneSegmentData = [NSNumber numberWithInteger: self.timeZoneSegment];
    NSNumber *timeTypeSegmentData = [NSNumber numberWithInteger: self.timeTypeSegment];

    [data setValue:backgroundColorData forKey:@"backgroundColorData"];
    [data setValue:digitColorData forKey:@"digitColorData"];
    [data setValue:digitSegmentData forKey:@"digitSegmentData"];
    [data setValue:backgroundSegmentData forKey:@"backgroundSegmentData"];
    [data setValue:timeZoneSegmentData forKey:@"timeZoneSegmentData"];
    [data setValue:timeTypeSegmentData forKey:@"timeTypeSegmentData"];
    BOOL writeToFile = [data writeToFile:path atomically:YES];
    
    if (writeToFile) {
        NSLog(@"Write to .plsit file is GREAT SUCCESS!");
    } else {
        NSLog(@"Write to .plist file is GREAT Failure!");
    }
    
}

-(void)retrieveTheData{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"myPlist.plist"];
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    NSData *backgroundColorData = [savedStock valueForKey:@"backgroundColorData"];
    NSData *digitColorData = [savedStock valueForKey:@"digitColorData"];
    NSNumber *digitSegmentData = [savedStock valueForKey:@"digitSegmentData"];
    NSNumber *backgroundSegmentData = [savedStock valueForKey:@"backgroundSegmentData"];
    NSNumber *timeZoneSegmentData = [savedStock valueForKey:@"timeZoneSegmentData"];
    NSNumber *timeTypeSegmentData = [savedStock valueForKey:@"timeTypeSegmentData"];

    UIColor *backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:backgroundColorData];
    [self setBackgroundColor:backgroundColor];
    
    UIColor *digitColor = [NSKeyedUnarchiver unarchiveObjectWithData:digitColorData];
    [self setDigitColor:digitColor];
    self.FirstDot.backgroundColor = digitColor;
    self.SecondDot.backgroundColor = digitColor;
    self.ampm.textColor = digitColor;
    
    NSInteger digitSegmentNumber = [digitSegmentData integerValue];
    NSInteger backgroundSegmentNumber = [backgroundSegmentData integerValue];
    NSInteger timeZoneSegmentNumber = [timeZoneSegmentData integerValue];
    NSInteger timeTypeSegmentNumber = [timeTypeSegmentData integerValue];
    [self.digitColor2 setSelectedSegmentIndex:digitSegmentNumber];
    [self.backgroundColor2 setSelectedSegmentIndex:backgroundSegmentNumber];
    [self.timeZone2 setSelectedSegmentIndex:timeZoneSegmentNumber];
    [self.timeType2 setSelectedSegmentIndex:timeTypeSegmentNumber];
    [self timeZone:self.timeZone2];
    [self timeType:self.timeType2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
