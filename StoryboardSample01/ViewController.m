//
//  ViewController.m
//  StoryboardSample01
//
//  Created by Hori,Masaki on 2016/03/30.
//  Copyright © 2016年 Hori,Masaki. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(nullable id)sender
{
	// アニメーション開始後に動作させない
	if([sender respondsToSelector:@selector(setAction:)]) {
		[sender setAction:nil];
	}
	
	NSViewController *d = segue.destinationController;
	d.representedObject = self.representedObject;
}

@end
