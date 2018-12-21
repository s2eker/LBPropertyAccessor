//
//  LBViewController.m
//  LBPropertyAccessor
//
//  Created by s2eker on 12/14/2018.
//  Copyright (c) 2018 s2eker. All rights reserved.
//

#import "LBViewController.h"
#import "LBTestModel.h"
#import "LBPropertyAccessor.h"

@interface LBViewController ()


@end

@implementation LBViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LBTestModel *model = [LBTestModel new];
    model.name = @"小红";
    model.sex = YES;
    model.type = LBTestType2;
    
    LBPropertyAccessorController *vc = [LBPropertyAccessorController instanceWithObj:model properties:@[@{@"name": @"name",
                                                                                                          @"des": @"姓名",
                                                                                                          @"values": @[@{@"value": @"小红",
                                                                                                                         @"des": @"老大"},
                                                                                                                       @{@"value": @"小蓝",
                                                                                                                         @"des": @"老二"},
                                                                                                                       @{@"value": @"小绿",
                                                                                                                         @"des": @"老三"},
                                                                                                                       ],
                                                                                                          
                                                                                                          },
                                                                                                        @{@"name": @"sex",
                                                                                                          @"des": @"性别",
                                                                                                          @"values": @[@{@"value": @"0",
                                                                                                                         @"des": @"女"},
                                                                                                                       @{@"value": @"1",
                                                                                                                         @"des": @"男"},
                                                                                                                       ],
                                                                                                          
                                                                                                          },
                                                                                                        @{@"name": @"type",
                                                                                                          @"des": @"类型",
                                                                                                          @"values": @[@{@"value": @"0",
                                                                                                                         @"des": @"第一类"},
                                                                                                                       @{@"value": @"1",
                                                                                                                         @"des": @"第二类"},
                                                                                                                       @{@"value": @"2",
                                                                                                                         @"des": @"第三类"},
                                                                                                                       ],
                                                                                                          
                                                                                                          },
                                                                                                        ]];
    [self.navigationController pushViewController:vc animated:YES];

    
}
@end
