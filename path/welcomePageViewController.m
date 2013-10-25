//
//  welcomePageViewController.m
//  path
//
//  Created by 王智锐 on 13-10-17.
//  Copyright (c) 2013年 王智锐. All rights reserved.
//

#import "welcomePageViewController.h"
#import "welcomePageModel.h"
#import "loginPopView.h"
@interface welcomePageViewController ()

@end

@implementation welcomePageViewController

NSUInteger kPageCount = 3;

#define SCREENWIDTH 1024
#define SCREENHEIGHT 768


@synthesize pageControll,scrollView,imageView,loginButton,registerButton,
        currentPage,backgroundImage1,backgroundImage2;
@synthesize  modelArr;
@synthesize popLoginView,popRegisterView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(1024*kPageCount, 768);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    CGRect frame = self.view.frame;
    //backgroundImage1 = [[UIImageView alloc] initWithFrame:frame];
    //[backgroundImage1 setContentMode:UIViewContentModeScaleAspectFill];
            [backgroundImage1 setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    //backgroundImage2 = [[UIImageView alloc]initWithFrame:frame];
    //[backgroundImage2 setContentMode:UIViewContentModeScaleAspectFill];
    modelArr = [[NSMutableArray alloc] init];
    welcomePageModel *page1 = [[welcomePageModel alloc] initWithTitle:@"heheh" description:@"he is a sb" image:@"11.jpg"];
    welcomePageModel *page2 = [[welcomePageModel alloc] initWithTitle:@"Interesting" description:@"life is about hehe!" image:@"22.jpg"];
    welcomePageModel *page3 = [[welcomePageModel alloc] initWithTitle:@"di san ye" description:@"zenme zheme duo shabi" image:@"33.jpg"];
    [modelArr addObject:page1];
    [modelArr addObject:page2];
    [modelArr addObject:page3];
    backgroundImage1.image = page1.image;
    backgroundImage2.image = page2.image;
    backgroundImage1.alpha = 1.0f;
    backgroundImage2.alpha = 0.0f;
    [self initLabelView];
    //[self.view addSubview:backgroundImage1];
    //[self.view addSubview:backgroundImage2];
//    backgroundImage2
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"start");
    //float timeInterval = 2.0f;
    //timer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(nextPage:) userInfo:nil repeats:YES] ;
    //NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    //[runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    NSLog(@"after");
    [self initPopView];
    //[self Login:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillDisappear:(BOOL)animated{
    //[timer invalidate];
}

-(void)initPopView{
    
    CGRect frame = CGRectMake(SCREENWIDTH/2-300/2, SCREENHEIGHT/2-400/2, 300, 400);
    
    if(popLoginView == nil){
        /*
        popLoginView = [[UIView alloc] initWithFrame:frame];
        [popLoginView setBackgroundColor:[UIColor whiteColor]];
        [popLoginView setCenter:CGPointMake(512, 384)];
        CGRect loginBarFrame = CGRectMake(0, 0, 224, 20);
        UIToolbar *loginToolBar = [[UIToolbar alloc]initWithFrame:loginBarFrame];
        [loginToolBar setBackgroundColor:[UIColor redColor]];
        [popLoginView addSubview:loginToolBar];
         */
        popLoginView = [[loginPopView alloc] initWithFrame:frame];
        //[self.view addSubview:popLoginView];
    }
    if(popRegisterView == nil){
        
    }
    
}


- (IBAction)registerAccount:(id)sender {
}

- (IBAction)Login:(id)sender {
    NSLog(@"login");
    [self.view addSubview:popLoginView];
    scrollView.userInteractionEnabled = NO;
    /*
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard.ipad" bundle:nil];
    UIViewController *loginPop = [storyboard instantiateViewControllerWithIdentifier:@"loginController"];
    [self.view addSubview:loginPop.view];
     */
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self updateScrollView];
}

-(void)updateScrollView{
    int scrollPage = MAX(0,MIN(kPageCount-1,(int)scrollView.contentOffset.x
                               /scrollView.frame.size.width));
    if(scrollPage != currentPage){
        currentPage = scrollPage;
        backgroundImage1.image = [(welcomePageModel*)[modelArr objectAtIndex:currentPage] image];
        backgroundImage2.image = (currentPage + 1 != kPageCount )? [(welcomePageModel*)[modelArr objectAtIndex:currentPage+1] image]:nil ;
    }
    
    float offset = MIN(scrollView.contentOffset.x - currentPage * scrollView.frame.size.width,scrollView.frame.size.width);
    
    if(offset < 0){
        
        backgroundImage1.alpha = 1.0f - (-offset/scrollView.frame.size.width);
        
    }else if(offset != 0){
        if(currentPage == kPageCount - 1){
            //NSLog(@"%f",offset);
            pageControll.currentPage = kPageCount - 1;
            backgroundImage1.alpha = 1.0f - (offset /scrollView.frame.size.width);
            //backgroundImage2.alpha = 1.0f - ( offset / scrollView.frame
              //                           .size.width);
        }else{
            
            pageControll.currentPage = (scrollView.contentOffset.x -
                                        currentPage * scrollView.frame.size.width) < scrollView.frame.size.width / 2 ? currentPage:
            currentPage+1;
            backgroundImage2.alpha = offset / scrollView.frame.size.width;
            backgroundImage1.alpha = 1- backgroundImage2.alpha;
        }
        
    }else{
        backgroundImage1.alpha = 1.0f;
        backgroundImage2.alpha = 0.0f;
        pageControll.currentPage = currentPage;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self updateScrollView];
}

-(void)initLabelView{
    NSLog(@"label");
    CGRect frame = scrollView.frame;
    for(int i = 0 ; i < kPageCount ; ++i){
        welcomePageModel *temp = (welcomePageModel*)[modelArr objectAtIndex:i];
        CGRect tempframe = CGRectOffset(frame, i*frame.size.width, 0);
        NSLog(@"%f",tempframe.origin.x);
        UILabel *titleLabel = [[UILabel alloc ] init];
        UILabel *contentLabel = [[UILabel alloc] init];
        titleLabel.frame = tempframe;
        contentLabel.frame = tempframe;
        [titleLabel setText:temp.title];
        [titleLabel setCenter:CGPointMake(tempframe.origin.x+tempframe.size.width/2, tempframe.size.height-300)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [contentLabel setText:temp.content];
        [contentLabel setCenter:CGPointMake(tempframe.origin.x+tempframe.size.width/2, tempframe.size.height-200)];
        [contentLabel setTextAlignment:NSTextAlignmentCenter];
        [scrollView addSubview:titleLabel];
        [scrollView addSubview:contentLabel];
    }
    
}

@end
