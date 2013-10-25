//
//  welcomePageViewController.h
//  path
//
//  Created by 王智锐 on 13-10-17.
//  Copyright (c) 2013年 王智锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface welcomePageViewController : UIViewController<UIScrollViewDelegate>
@property int currentPage;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControll;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage1;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage2;
@property (strong,nonatomic) NSMutableArray *modelArr;
@property (strong,nonatomic)   UIView *popLoginView;
@property (strong,nonatomic)   UIView *popRegisterView;
- (IBAction)registerAccount:(id)sender;
- (IBAction)Login:(id)sender;



@end
