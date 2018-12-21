//
//  LBProperty.h
//  LBPropertyAccessor
//
//  Created by 李兵 on 2018/12/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBValue : NSObject
@property (nonatomic, copy)NSString *des;
@property (nonatomic, copy)NSString *value;
@end

@interface LBProperty : NSObject

@property (nonatomic, strong) LBValue *name;
@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) UIColor *color;

+ (instancetype)propertyWithDic:(NSDictionary *)dic;

@end



NS_ASSUME_NONNULL_END
