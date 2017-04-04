//
//  ViewController.m
//  PanoramaDemo
//
//  Created by shiyj on 17/4/4.
//  Copyright © 2017年 shiyj. All rights reserved.
//

#import "ViewController.h"
#import "GIKGyroDemoController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)gyroPositionTest:(id)sender {
    GIKGyroDemoController *con = [[GIKGyroDemoController alloc] init];
    [self.navigationController pushViewController:con animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
