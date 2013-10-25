//
//  loginPopView.m
//  path
//
//  Created by 王智锐 on 13-10-22.
//  Copyright (c) 2013年 王智锐. All rights reserved.
//

#import "loginPopView.h"

@implementation loginPopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        [self setBackgroundColor:[UIColor grayColor]];
        CGRect toolFrame = CGRectMake(0,0, frame.size.width, 60);
        UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:toolFrame];
        [toolBar setBackgroundColor:[UIColor redColor]];
        [self addSubview:toolBar];
        CGRect barButtonFrame = CGRectMake(0, 0, 40, 40);
        UIButton *barButton = [[UIButton alloc] initWithFrame:barButtonFrame];
        [barButton setTitle:@"back" forState:UIControlStateNormal];
        [toolBar addSubview:barButton];
        [barButton addTarget:self action:@selector(removeItself) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)removeItself{
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
