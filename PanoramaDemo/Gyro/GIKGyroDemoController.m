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
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic,strong) NSMutableArray *allImages;
@property (nonatomic,assign) NSInteger currentIndex;
@end

@implementation GIKGyroDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImageWithIndex];
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
                CGFloat rotationRate = gyroData.rotationRate.y;
                if (fabs(rotationRate) >= 0.1) {
                    _currentIndex = _currentIndex - rotationRate * 10 ;
                    NSLog(@"current index :%zd   rotationRate:%.2f",_currentIndex,rotationRate);
                
                    [self setImageWithIndex];
                }
            });
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImageWithIndex {
    if (_currentIndex < 0) {
        _currentIndex = 0;
    }

    
    if (_currentIndex >= [self.allImages count]) {
        _currentIndex = [self.allImages count] - 1;
    }

    NSLog(@"current index :%zd",_currentIndex);
    self.imgView.image = self.allImages[_currentIndex];
}

- (NSMutableArray *)allImages {
    if (nil == _allImages) {
        NSInteger max = 111;
        _currentIndex = max/2.0;
        _allImages = [NSMutableArray new];
        for (NSInteger i=1; i<=max; i++) {
            NSString *name = [NSString stringWithFormat:@"tt_%04zd_图层-%zd",max - i,i];
            UIImage *img = [UIImage imageNamed:name];
            if (img) {
                [_allImages addObject:img];
            }
        }
        
        [self setImageWithIndex];
    }
    return _allImages;
}
- (CMMotionManager *)cmManager {
    if (nil == _cmManager) {
        _cmManager = [[CMMotionManager alloc] init];
        _cmManager.gyroUpdateInterval = 0.1;
    }
    return _cmManager;
}
@end
