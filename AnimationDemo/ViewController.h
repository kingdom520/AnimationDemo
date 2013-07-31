//
//  ViewController.h
//  AnimationDemo
//
//  Created by CocoaDev2 on 21/7/13.
//  Copyright (c) 2013 CocoaDev2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *mScrollView;
    
    BOOL leftDirecting;
    CGFloat mPosX;
    NSTimer *mtimer;
}

@end
