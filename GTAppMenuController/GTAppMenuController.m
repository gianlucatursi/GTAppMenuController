//
//  GTMainViewController.m
//  GTAppMenuController
//
//  Created by Gianluca Tursi on 24/05/14.
//  Copyright (c) 2014 Gianluca Tursi. All rights reserved.
//

#import "GTAppMenuController.h"
#import "GTAppDelegate.h"


@interface GTAppMenuController ()
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@end

@implementation GTAppMenuController{
    
    float firstX;
    float firstY;
    CGPoint _origin;
    CGPoint _final;
    
}

static UIWindow *frontWindow;
static UIWindow *backWindow;

+ (void)instantiateFrontViewControllerWithIdentifierPath:(NSString*)front backViewControllerWithIdentifierPath:(NSString*)back
{
    NSArray *backPath = [back componentsSeparatedByString:@"."];
    UIStoryboard *backStoryboard = [UIStoryboard storyboardWithName:[backPath firstObject] bundle:nil];
    UIViewController *backViewController = [backStoryboard instantiateViewControllerWithIdentifier:[backPath lastObject]];
    
    backWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    backWindow.rootViewController = backViewController;
    [backWindow makeKeyAndVisible];
    
    NSArray *frontPath = [front componentsSeparatedByString:@"."];
    UIStoryboard *frontStoryboard = [UIStoryboard storyboardWithName:[frontPath firstObject] bundle:nil];
    UIViewController *frontViewController = [frontStoryboard instantiateViewControllerWithIdentifier:[frontPath lastObject]];

    frontWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    frontWindow.rootViewController = frontViewController;
    frontWindow.windowLevel = UIWindowLevelStatusBar;
    [frontWindow makeKeyAndVisible];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.duration = .3f;
        self.headerHeight = 60;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    frontWindow.layer.shadowRadius = 5.0f;
    frontWindow.layer.shadowOffset = CGSizeMake(0,0);
    frontWindow.layer.shadowColor = [UIColor blackColor].CGColor;
    frontWindow.layer.shadowOpacity = .9f;

}

-(void)activateSwipeToOpenMenu:(BOOL)onlyNavigation{
    
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    if (onlyNavigation == YES) {
        [self.navigationBar addGestureRecognizer:_panGesture];
    }else{
        [frontWindow addGestureRecognizer:_panGesture];
    }
    
    
    
}
-(void)openAndCloseMenu{
    
    
    CGPoint finalOrigin;
    CGRect f = frontWindow.frame;
    
    if (f.origin.y == CGPointZero.y)
        finalOrigin.y = CGRectGetHeight([UIScreen mainScreen].bounds) - self.headerHeight;
    else
        finalOrigin.y = CGPointZero.y;
    
    finalOrigin.x = 0;
    f.origin = finalOrigin;
    [UIView animateWithDuration:self.duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         frontWindow.transform = CGAffineTransformIdentity;
                         frontWindow.frame = f;
                         
                     } completion:nil];
    
    
}

-(void)setAnimationDuration:(CGFloat)d{
    self.duration = d;
}


- (void)onPan:(UIPanGestureRecognizer *)pan
{
    CGPoint translation = [pan translationInView:frontWindow];
    CGPoint velocity = [pan velocityInView:frontWindow];
    
    switch (pan.state) {
            
        case UIGestureRecognizerStateBegan:
            
            _origin = frontWindow.frame.origin;
            
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGFloat y = _origin.y + translation.y;
            if (y >= 0){
                frontWindow.transform = CGAffineTransformMakeTranslation(0, translation.y);
                
                CGFloat xscale = 1.0 - (((y * 100.0) / frontWindow.frame.size.height) / 1000.0);
                frontWindow.rootViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, xscale, 1.0);
            }
        }
            break;
            
        case UIGestureRecognizerStateEnded:
            
        case UIGestureRecognizerStateCancelled:
        {
            CGPoint finalOrigin = CGPointZero;
            CGAffineTransform trasnform = CGAffineTransformIdentity;
            if (velocity.y >= 0) {
                finalOrigin.y = CGRectGetHeight([UIScreen mainScreen].bounds) - self.headerHeight;
                 trasnform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 1.0);;
            }
            
            CGRect f = frontWindow.frame;
            f.origin = finalOrigin;
            [UIView animateWithDuration:self.duration
                                  delay:0.0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 frontWindow.transform = CGAffineTransformIdentity;
                                 frontWindow.frame = f;
                                 frontWindow.rootViewController.view.transform = trasnform;
                                 
                             } completion:nil];
            
        }
            break;
            
        default:
            break;
    }
}

@end
