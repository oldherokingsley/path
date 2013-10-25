//
//  welcomePageModel.m
//  path
//
//  Created by 王智锐 on 13-10-21.
//  Copyright (c) 2013年 王智锐. All rights reserved.
//

#import "welcomePageModel.h"

@implementation welcomePageModel

@synthesize image,content,title;

- (id) initWithTitle:(NSString*)atitle description:(NSString*)desc image:(NSString*)imageText {
    self = [super init];
    if(self != nil) {
        title = atitle;
        content = desc;
        image = [UIImage imageNamed:imageText];
    }
    return self;
}


@end
