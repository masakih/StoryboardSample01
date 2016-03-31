//
//  SlideSegue.m
//  StoryboardSample01
//
//  Created by Hori,Masaki on 2016/03/31.
//  Copyright © 2016年 Hori,Masaki. All rights reserved.
//

#import "SlideSegue.h"

#import <Quartz/Quartz.h>

@implementation SlideSegue
- (void)perform
{
	NSViewController *s = self.sourceController;
	NSViewController *d = self.destinationController;
	NSViewController *p = s.parentViewController;
	if(![p.childViewControllers containsObject:d]) {
		[p addChildViewController:d];
	}
	
	NSRect frame = s.view.frame;
	frame.origin.x = frame.size.width;
	d.view.frame = frame;
	[s.view.superview addSubview:d.view];
	
	NSRect newDFrame = s.view.frame;
	
	NSRect newSFrame = s.view.frame;
	newSFrame.origin.x = -newSFrame.size.width;
	
	[NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
		context.duration = 1;
		context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
		
		s.view.animator.frame = newSFrame;
		d.view.animator.frame = newDFrame;
	} completionHandler:^{
		[s removeFromParentViewController];
		[s.view removeFromSuperview];
	}];
}
@end
