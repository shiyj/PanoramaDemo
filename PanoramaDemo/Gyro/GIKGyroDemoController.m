//
//  GIKGyroDemoController.m
//  PanoramaDemo
//
//  Created by shiyj on 17/4/4.
//  Copyright © 2017年 shiyj. All rights reserved.
//

#import "GIKGyroDemoController.h"
#import <CoreMotion/CoreMotion.h>
#import "CRMotionView.h"

@interface GIKGyroDemoController ()
@property (weak, nonatomic) IBOutlet UILabel *promotionLabel;

@property (weak, nonatomic) IBOutlet CRMotionView *crMotionView;
@property (nonatomic,strong) CMMotionManager *cmManager;

@end

@implementation GIKGyroDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGyro];
    UIImage *img = [UIImage imageNamed:@"golden gate"];
    [self.crMotionView setImage:img];
}

- (void)setUpGyro {
    if (!self.cmManager.isGyroAvailable) {
        return;
    }
    
    if (NO == self.cmManager.isGyroActive) {
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        __weak typeof(self) __weakSelf = self;
        [self.cmManager startGyroUpdatesToQueue:queue withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                __weakSelf.promotionLabel.text = gyroData.description;
            });
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CMMotionManager *)cmManager {
    if (nil == _cmManager) {
        _cmManager = [[CMMotionManager alloc] init];
        _cmManager.gyroUpdateInterval = 2;
    }
    return _cmManager;
}
@end
