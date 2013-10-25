//
//  welcomePageModel.h
//  path
//
//  Created by 王智锐 on 13-10-21.
//  Copyright (c) 2013年 王智锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface welcomePageModel : NSObject

@property (strong,nonatomic)UIImage *image;
@property (strong,nonatomic)NSString *title;
@property (strong,nonatomic)NSString *content;

- (id) initWithTitle:(NSString*)atitle description:(NSString*)desc image:(NSString*)imageText;


@end
