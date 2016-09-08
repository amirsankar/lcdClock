//
//  MyDigit.m
//  TheClock
//
//  Created by amir sankar on 4/25/16.
//  Copyright © 2016 amir sankar. All rights reserved.
//

#import "MyDigit.h"


@interface MyDigit (){
    NSArray *segmentArray;
}

@end

@implementation MyDigit
-(id)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super initWithCoder:aDecoder])) {
        self.view = [[[NSBundle mainBundle] loadNibNamed:@"MyDigit" owner:self options:nil] objectAtIndex:0];
        
        self.view.frame = self.bounds;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.view];
    }
    
    segmentArray = @[self.Top, self.Middle, self.Bottom, self.TopLeft, self.TopRight, self.BottomLeft, self.BottomRight];
    
    return self;
}

-(void)showDigit:(long)digit{
    
    for (int i = 0; i < segmentArray.count; i++) {
        [segmentArray[i] setHidden:NO];
    }
    
    switch((long)digit){
            
            
            
        case 0:
            self.Middle.hidden = YES;
            break;
            
        case 1:
            self.Top.hidden = YES;
            self.Middle.hidden = YES;
            self.Bottom.hidden = YES;
            self.TopRight.hidden = YES;
            self.BottomRight.hidden = YES;
            break;
            
        case 2:
            self.TopLeft.hidden = YES;
            self.BottomRight.hidden = YES;
            break;
            
        case 3:
            self.TopLeft.hidden = YES;
            self.BottomLeft.hidden = YES;
            break;
            
        case 4:
            self.Top.hidden = YES;
            self.BottomLeft.hidden = YES;
            self.Bottom.hidden = YES;
            break;
            
        case 5:
            self.TopRight.hidden = YES;
            self.BottomLeft.hidden = YES;
            break;
            
        case 6:
            self.TopRight.hidden = YES;
            break;
            
        case 7:
            self.TopLeft.hidden = YES;
            self.Middle.hidden = YES;
            self.BottomLeft.hidden = YES;
            self.Bottom.hidden = YES;
            break;
            
        case 8:
            break;
            
        case 9:
            self.BottomLeft.hidden = YES;
            self.Bottom.hidden = YES;
            break;
    }
}

-(void)setColor: (UIColor *)digitColor{
    
    for (int i = 0; i < segmentArray.count; i++) {
        [segmentArray[i] setBackgroundColor:digitColor];
    }
}



@end
