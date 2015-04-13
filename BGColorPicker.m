//
//  BGColorPicker.m
//  Early
//
//  Created by Dana Katz on 3/9/15.
//  Copyright (c) 2015 Dana Katz. All rights reserved.
//
//  Custom view for picking background color.
//

#import "BGColorPicker.h"
@interface BGColorPicker ()

@property (strong, nonatomic) UIView *redDot;
@property (strong, nonatomic) UIView *blueDot;
@property (strong, nonatomic) UIView *greenDot;

@property (strong, nonatomic) UILabel *redLabel;
@property (strong, nonatomic) UILabel *blueLabel;
@property (strong, nonatomic) UILabel *greenLabel;

@end

@implementation BGColorPicker

- (id) init {
    self = [super initWithFrame:CGRectMake(0, 0, 325, 162)];
    [self setBackgroundColor:[UIColor whiteColor]];
    [[self layer] setCornerRadius:10.0];
    [[self layer] setMasksToBounds:YES];
    
    [self addBluePicker];
    [self addGreenPicker];
    [self addRedPicker];
    
    return self;
}

// add smallest circle and red dot
- (void) addRedPicker {
    // initialize red dot
    self.redDot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
    [self.redDot.layer setCornerRadius:8];
    [self.redDot setBackgroundColor:[UIColor redColor]];
    [self.redDot setCenter:CGPointMake(self.center.x + 50, self.center.y - 26)];
    [self.redDot setTag:101];
    
    // initialize circle
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 54, 54)];
    [circle.layer setCornerRadius:27];
    [circle setBackgroundColor:[UIColor whiteColor]];
    [circle.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [circle.layer setBorderWidth:1];
    [circle setCenter:CGPointMake(self.center.x + 50, self.center.y)];
    [self addSubview:circle];
    
    // add pan gesture recognizer to red dot
    UIPanGestureRecognizer *panGestRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveDot:)];
    [self.redDot addGestureRecognizer:panGestRec];
    [self addSubview:self.redDot];
    
    // add labels to show red value
    UILabel *redTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                  self.frame.origin.y - 10 + (self.frame.size.height / 4),
                                                                  self.frame.size.width / 5,
                                                                  20)];
    [redTitle setTextAlignment:NSTextAlignmentRight];
    [redTitle setText:@"Red"];
    [redTitle setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    [self addSubview:redTitle];
    
    self.redLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 5 + 20,
                                                             self.frame.origin.y - 10 + (self.frame.size.height / 4),
                                                              self.frame.size.width / 5,
                                                              20)];
    [self.redLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    [self.redLabel setText:[NSString stringWithFormat:@"%d", (int) [self redValue]]];
    [self addSubview:self.redLabel];
}

// same as addRedPicker, but for green
- (void) addGreenPicker {
    self.greenDot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
    [self.greenDot.layer setCornerRadius:8];
    [self.greenDot setBackgroundColor:[UIColor greenColor]];
    [self.greenDot setCenter:CGPointMake(self.center.x + 50, self.center.y - 46)];
    [self.greenDot setTag:102];
    
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 94, 94)];
    [circle.layer setCornerRadius:47];
    [circle setBackgroundColor:[UIColor whiteColor]];
    [circle.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [circle.layer setBorderWidth:1];
    [circle setCenter:CGPointMake(self.center.x + 50, self.center.y)];
    [self addSubview:circle];
    
    UIPanGestureRecognizer *panGestRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveDot:)];
    [self.greenDot addGestureRecognizer:panGestRec];
    [self addSubview:self.greenDot];
    
    // add label to show red value
    UILabel *greenTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                  self.frame.origin.y - 10 + (self.frame.size.height / 2),
                                                                  self.frame.size.width / 5 + 1,
                                                                  20)];
    [greenTitle setTextAlignment:NSTextAlignmentRight];
    [greenTitle setText:@"Green"];
    [greenTitle setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    [self addSubview:greenTitle];
    
    self.greenLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 5 + 20,
                                                              self.frame.origin.y - 10 + (self.frame.size.height / 2),
                                                              self.frame.size.width / 5,
                                                              20)];
    [self.greenLabel setText:[NSString stringWithFormat:@"%d", (int) [self greenLabel]]];
    [self.greenLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    [self addSubview:self.greenLabel];
}

// same as addRedPicker, but for blue
- (void) addBluePicker {
    self.blueDot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
    [self.blueDot.layer setCornerRadius:8];
    [self.blueDot setBackgroundColor:[UIColor blueColor]];
    [self.blueDot setCenter:CGPointMake(self.center.x + 50, self.center.y - 66)];
    [self.blueDot setTag:103];
    
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 134, 134)];
    [circle.layer setCornerRadius:67];
    [circle setBackgroundColor:[UIColor whiteColor]];
    [circle.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [circle.layer setBorderWidth:1];
    [circle setCenter:CGPointMake(self.center.x + 50, self.center.y)];
    [self addSubview:circle];
    
    UIPanGestureRecognizer *panGestRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveDot:)];
    [self.blueDot addGestureRecognizer:panGestRec];
    [self addSubview:self.blueDot];
    
    // add label to show red value
    UILabel *blueTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                  self.frame.origin.y - 10 + (3 * self.frame.size.height / 4),
                                                                  self.frame.size.width / 5,
                                                                  20)];
    [blueTitle setTextAlignment:NSTextAlignmentRight];
    [blueTitle setText:@"Blue"];
    [blueTitle setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    [self addSubview:blueTitle];
    
    self.blueLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 5 + 20,
                                                              self.frame.origin.y - 10 + (3 * self.frame.size.height / 4),
                                                              self.frame.size.width / 5,
                                                              20)];
    [self.blueLabel setText:[NSString stringWithFormat:@"%d", (int) [self blueValue]]];
    [self.blueLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
    [self addSubview:self.blueLabel];
    
}

// constrain dots to circles using trigonometry
- (void) moveDot:(UIPanGestureRecognizer *)sender {
    if([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [sender translationInView:self];
        
        if([sender.view tag] == 101) {                                              // if red dot, constrain to smallest circle
            double x = self.frame.origin.x + self.redDot.center.x + translation.x;  // new x relative to superview
            double deltaX = x - self.center.x - 50;                                 // delta x relative to circle center
            double y = self.frame.origin.y + self.redDot.center.y + translation.y;  // new y relative to superview
            double deltaY = self.center.y - y;                                      // delta y relative to circle center
            double theta = atan(deltaY/deltaX);                                     // angle of coordinates
            double newDeltaX = 26*cos(theta);                                       // intersection of circle and line from circle center to (deltaX, deltaY)
            double newDeltaY = 26*sin(theta);
            newDeltaY *= -1;
            if(deltaX < 0) {
                newDeltaX *= -1;
                newDeltaY *= -1;
            }
            
            double newX = self.center.x + 50 + newDeltaX - self.frame.origin.x;     // new delta x on circle relative to this view
            double newY = self.center.y + newDeltaY - self.frame.origin.y;          // new delta y on circle relative to this view
            
            self.redDot.center = CGPointMake(newX, newY);                           // set red circle center
            [sender setTranslation:CGPointZero inView:self];                        // reset translation
            [self.redLabel setText:[NSString stringWithFormat:@"%d", (int) [self redValue]]]; // set red label
            
        } else if([sender.view tag] == 102) {                                       // if green dot, constrain to middle circle
            double x = self.frame.origin.x + self.greenDot.center.x + translation.x;
            double deltaX = x - self.center.x - 50;
            double y = self.frame.origin.y + self.greenDot.center.y + translation.y;
            double deltaY = self.center.y - y;
            double theta = atan(deltaY/deltaX);
            double newDeltaY = 46*sin(theta);
            double newDeltaX = 46*cos(theta);
            newDeltaY *= -1;
            if(deltaX < 0) {
                newDeltaX *= -1;
                newDeltaY *= -1;
            }
            double newX = self.center.x + 50 + newDeltaX - self.frame.origin.x;
            double newY = self.center.y + newDeltaY - self.frame.origin.y;

            self.greenDot.center = CGPointMake(newX, newY);
            [sender setTranslation:CGPointZero inView:self];
            [self.greenLabel setText:[NSString stringWithFormat:@"%d", (int) [self greenValue]]];
            
        } else if([sender.view tag] == 103) {                                       // if blue dot, constrain to largest circle
            double x = self.frame.origin.x + self.blueDot.center.x + translation.x;
            double deltaX = x - self.center.x - 50;
            double y = self.frame.origin.y + self.blueDot.center.y + translation.y;
            double deltaY = self.center.y - y;

            double theta = atan(deltaY/deltaX);

            double newDeltaY = 66*sin(theta);
            double newDeltaX = 66*cos(theta);
            newDeltaY *= -1;
            if(deltaX < 0) {
                newDeltaX *= -1;
                newDeltaY *= -1;
            }

            double newX = self.center.x + 50 + newDeltaX - self.frame.origin.x;
            double newY = self.center.y + newDeltaY - self.frame.origin.y;
            
            self.blueDot.center = CGPointMake(newX, newY);
            [sender setTranslation:CGPointZero inView:self];
            [self.blueLabel setText:[NSString stringWithFormat:@"%d", (int) [self blueValue]]];
            
        }
    }
    
    // change background color of superview -- update in real time
    [self.superview setBackgroundColor:[UIColor colorWithRed:[self redValue]/255 green:[self greenValue]/255 blue:[self blueValue]/255 alpha:1.0]];
}

// find red value as proportion of angle to whole circle, multiply by 255 for RGB value
- (double) redValue {
    double x = self.frame.origin.x + self.redDot.center.x;
    double deltaX = x - self.center.x - 50;
    double y = self.frame.origin.y + self.redDot.center.y;
    double deltaY = self.center.y - y;
    
    double theta = atan(deltaY/deltaX);
    double adjustedTheta;
    if(deltaX > 0) {
        adjustedTheta = M_PI_2 - theta;
    } else if(deltaX < 0) {
        adjustedTheta = 3*M_PI_2 - theta;
    }
    
    return 255*(adjustedTheta / (2*M_PI));
}

// find green value as proportion of angle to whole circle, multiply by 255 for RGB value
- (double) greenValue {
    double x = self.frame.origin.x + self.greenDot.center.x;
    double deltaX = x - self.center.x - 50;
    double y = self.frame.origin.y + self.greenDot.center.y;
    double deltaY = self.center.y - y;
    
    double theta = atan(deltaY/deltaX);
    double adjustedTheta;
    if(deltaX > 0) {
        adjustedTheta = M_PI_2 - theta;
    } else if(deltaX < 0) {
        adjustedTheta = 3*M_PI_2 - theta;
    }
    
    return 255*(adjustedTheta / (2*M_PI));
}

// find blue value as proportion of angle to whole circle, multiply by 255 for RGB value
- (double) blueValue {
    double x = self.frame.origin.x + self.blueDot.center.x;
    double deltaX = x - self.center.x - 50;
    double y = self.frame.origin.y + self.blueDot.center.y;
    double deltaY = self.center.y - y;
    
    double theta = atan(deltaY/deltaX);
    double adjustedTheta;
    if(deltaX > 0) {
        adjustedTheta = M_PI_2 - theta;
    } else if(deltaX < 0) {
        adjustedTheta = 3*M_PI_2 - theta;
    }
    
    return 255*(adjustedTheta / (2*M_PI));
}

// position red dot according to current background red value
- (void) setRedValue:(double) v {
    [self.redLabel setText:[NSString stringWithFormat:@"%d", (int) (v * 255)]];
    
    if(v == 1) {
        return;                                                 // leave at top of circle
    }
    
    double adjustedTheta = 2 * v * M_PI;
    double newX;
    double newY;
    
    if(v == 0) {                                                // if zero, top of circle
        newX = self.center.x + 50 - self.frame.origin.x;
        newY = self.center.y - 26 - self.frame.origin.y;
    } else if(v == .25) {                                       // if .25, rightmost circle point
        newX = self.center.x + 50 + 26 - self.frame.origin.x;
        newY = self.center.y - self.frame.origin.y;
    } else if(v == .5) {                                        // if .5, bottom of circle
        newX = self.center.x + 50 - self.frame.origin.x;
        newY = self.center.y + 26 - self.frame.origin.y;
    } else if(v == .75) {                                       // if .75, leftmost circle point
        newX = self.center.x + 50 - 26 - self.frame.origin.x;
        newY = self.center.y - self.frame.origin.y;
    } else if(adjustedTheta < M_PI) {                           // calculate new point on circle
        double theta = M_PI_2 - adjustedTheta;
        double deltaX = 26 * cos(theta);
        double deltaY = 26 * sin(theta);
        if(deltaX < 0) {
            deltaX *= -1;
            deltaY *= -1;
        }
        newX = self.center.x + 50 + deltaX - self.frame.origin.x;
        newY = self.center.y - deltaY - self.frame.origin.y;
    } else  {
        double theta = 3 * M_PI_2 - adjustedTheta;
        double deltaX = 26 * cos(theta);
        double deltaY = 26 * sin(theta);
        if(deltaX > 0) {
            deltaX *= -1;
            deltaY *= -1;
        }
        newX = self.center.x + 50 + deltaX - self.frame.origin.x;
        newY = self.center.y - deltaY - self.frame.origin.y;
    }
    
    [self.redDot setCenter:CGPointMake(newX, newY)];
    
}

// position green dot according to current background green value
- (void) setGreenValue:(double) v {
    [self.greenLabel setText:[NSString stringWithFormat:@"%d", (int) (v * 255)]];
    
    if(v == 1) {
        return;
    }
    
    double adjustedTheta = 2 * v * M_PI;
    double newX;
    double newY;
    
    if(v == 0) {
        newX = self.center.x + 50 - self.frame.origin.x;
        newY = self.center.y - 46 - self.frame.origin.y;
    } else if(v == .25) {
        newX = self.center.x + 50 + 46 - self.frame.origin.x;
        newY = self.center.y - self.frame.origin.y;
    } else if(v == .5) {
        newX = self.center.x + 50 - self.frame.origin.x;
        newY = self.center.y + 46 - self.frame.origin.y;
    } else if(v == .75) {
        newX = self.center.x + 50 - 46 - self.frame.origin.x;
        newY = self.center.y - self.frame.origin.y;
    } else if(adjustedTheta < M_PI) {
        double theta = M_PI_2 - adjustedTheta;
        double deltaX = 46 * cos(theta);
        double deltaY = 46 * sin(theta);
        if(deltaX < 0) {
            deltaX *= -1;
            deltaY *= -1;
        }
        newX = self.center.x + 50 + deltaX - self.frame.origin.x;
        newY = self.center.y - deltaY - self.frame.origin.y;
    } else  {
        double theta = 3 * M_PI_2 - adjustedTheta;
        double deltaX = 46 * cos(theta);
        double deltaY = 46 * sin(theta);
        if(deltaX > 0) {
            deltaX *= -1;
            deltaY *= -1;
        }
        newX = self.center.x + 50 + deltaX - self.frame.origin.x;
        newY = self.center.y - deltaY - self.frame.origin.y;
    }
    
    [self.greenDot setCenter:CGPointMake(newX, newY)];
}

// position blue dot according to current background blue value
- (void) setBlueValue:(double) v {
    [self.blueLabel setText:[NSString stringWithFormat:@"%d", (int) (v * 255)]];
    
    if(v == 1) {
        return;
    }
    
    double adjustedTheta = 2 * v * M_PI;
    double newX;
    double newY;
    
    if(v == 0) {
        newX = self.center.x + 50 - self.frame.origin.x;
        newY = self.center.y - 66 - self.frame.origin.y;
    } else if(v == .25) {
        newX = self.center.x + 50 + 66 - self.frame.origin.x;
        newY = self.center.y - self.frame.origin.y;
    } else if(v == .5) {
        newX = self.center.x + 50 - self.frame.origin.x;
        newY = self.center.y + 66 - self.frame.origin.y;
    } else if(v == .75) {
        newX = self.center.x + 50 - 66 - self.frame.origin.x;
        newY = self.center.y - self.frame.origin.y;
    } else if(adjustedTheta < M_PI) {
        double theta = M_PI_2 - adjustedTheta;
        double deltaX = 66 * cos(theta);
        double deltaY = 66 * sin(theta);
        if(deltaX < 0) {
            deltaX *= -1;
            deltaY *= -1;
        }
        newX = self.center.x + 50 + deltaX - self.frame.origin.x;
        newY = self.center.y - deltaY - self.frame.origin.y;
    } else  {
        double theta = 3 * M_PI_2 - adjustedTheta;
        double deltaX = 66 * cos(theta);
        double deltaY = 66 * sin(theta);
        if(deltaX > 0) {
            deltaX *= -1;
            deltaY *= -1;
        }
        newX = self.center.x + 50 + deltaX - self.frame.origin.x;
        newY = self.center.y - deltaY - self.frame.origin.y;
    }
    
    [self.blueDot setCenter:CGPointMake(newX, newY)];
}


@end
