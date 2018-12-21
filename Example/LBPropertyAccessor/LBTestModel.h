//
//  LBTestModel.h
//  LBPropertyAccessor_Example
//
//  Created by 李兵 on 2018/12/19.
//  Copyright © 2018 s2eker. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, LBTestType) {
    LBTestType1,
    LBTestType2,
    LBTestType3,
    LBTestType4,
};

NS_ASSUME_NONNULL_BEGIN

@interface LBTestModel : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)BOOL sex;
@property (nonatomic, assign)LBTestType type;


@end

NS_ASSUME_NONNULL_END
