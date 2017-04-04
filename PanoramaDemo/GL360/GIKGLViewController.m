//
//  GIKGLViewController.m
//  PanoramaDemo
//
//  Created by shiyj on 17/4/4.
//  Copyright © 2017年 shiyj. All rights reserved.
//

#import "GIKGLViewController.h"
#import "PanoramaView.h"




@interface GIKGLViewController()
@property (nonatomic,strong) PanoramaView *panoramaView;
@end

@implementation GIKGLViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    PanoramaView *panoramaView = [[PanoramaView alloc] init];
    UIImage *img = [UIImage imageNamed:@"park_2048.jpg"];
    [panoramaView setImage:img];
//    	[panoramaView setImageWithName:@"park_2048.jpg"];
//        [panoramaView setImageWithName:@"鱼眼全景.jpg"];
    [panoramaView setOrientToDevice:YES];
    [panoramaView setTouchToPan:NO];
    [panoramaView setPinchToZoom:YES];
    [panoramaView setShowTouches:NO];
    [panoramaView setVRMode:NO];
    [self setView:panoramaView];
    self.panoramaView = panoramaView;
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [self.panoramaView draw];
}
@end
