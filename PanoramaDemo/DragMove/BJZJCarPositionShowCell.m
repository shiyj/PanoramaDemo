//
//  BJZJCarPositionShowCell.m
//  PanoramaDemo
//
//  Created by mc001 on 2017/11/15.
//  Copyright © 2017年 shiyj. All rights reserved.
//

#import "BJZJCarPositionShowCell.h"

@interface BJZJCarPositionShowCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation BJZJCarPositionShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

static CGFloat kBJZJCPSCStartX = 0;

- (IBAction)gestureChanged:(id)sender {
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)sender;
    CGPoint pt = [pan translationInView:self.imgView];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        kBJZJCPSCStartX = pt.x;
    } else {
        CGFloat diff = pt.x - kBJZJCPSCStartX;
        CGFloat maxDis = 100;
        if (diff >= maxDis) {
            kBJZJCPSCStartX = pt.x;
            
        }
    }
    
    
}

@end
