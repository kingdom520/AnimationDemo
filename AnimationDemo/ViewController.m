//
//  ViewController.m
//  AnimationDemo
//
//  Created by CocoaDev2 on 21/7/13.
//  Copyright (c) 2013 CocoaDev2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    mScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
    mScrollView.backgroundColor = [UIColor redColor];
    mScrollView.delegate = self;
    mScrollView.contentSize = CGSizeMake(640, 400);
    [self.view addSubview:mScrollView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 350, 100)];
    view.backgroundColor = [UIColor blackColor];
    [mScrollView addSubview:view];
    
    leftDirecting = YES;
    [self startScrollingDriver];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //Stop animating driver
    [self stopScrollingDriver];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //Start animating driver
    [self performSelector:@selector(startScrollingDriver) withObject:nil afterDelay:5.0];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        [self performSelector:@selector(startScrollingDriver) withObject:nil afterDelay:5.0];
    }
}

-(BOOL) animating
{
    return  (BOOL)mtimer;
}

-(void) startScrollingDriver
{
    if (self.animating)
    {
        return;
    }
    mtimer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                              target:self
                                            selector:@selector(updateScrollOffset)
                                            userInfo:nil
                                             repeats:YES];
    [mtimer fire];
}

- (void)stopScrollingDriver
{
    if (!self.animating)
    {
        return;
    }
    [mScrollView.layer removeAllAnimations];
    [mtimer invalidate];
    mtimer = nil;
}

-(void) updateScrollOffset
{
    CGFloat pointChange = 1.0;
    CGPoint newOffset = mScrollView.contentOffset;
    
    if(newOffset.x + 320 >= 640)
    {
        leftDirecting = NO;
    }
    else if(newOffset.x < 0)
    {
        leftDirecting = YES;
    }
    
    if(leftDirecting)
    {
        newOffset.x = newOffset.x + pointChange;
    }
    else
    {
        newOffset.x = newOffset.x - pointChange;
    }
    NSLog(@"%f",newOffset.x);
    
    [mScrollView setContentOffset:newOffset];
}

@end
