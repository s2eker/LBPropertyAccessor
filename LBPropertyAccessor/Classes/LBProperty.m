//
//  LBProperty.m
//  LBPropertyAccessor
//
//  Created by 李兵 on 2018/12/20.
//

#import "LBProperty.h"

@implementation LBValue
- (NSString *)description {
    return [NSString stringWithFormat:@"%@:%@", self.des, self.value];
}
@end

@implementation LBProperty
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.color = [UIColor colorWithRed:arc4random()%200/255.0 green:arc4random()%200/255.0 blue:arc4random()%200/255.0 alpha:1];
    }
    return self;
}
+ (instancetype)propertyWithDic:(NSDictionary *)dic {
    LBProperty *p = [LBProperty new];
    p.name = [LBValue new];
    p.name.value = dic[@"name"];
    p.name.des = dic[@"des"];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSDictionary *d in dic[@"values"]) {
        LBValue *v = [LBValue new];
        v.value = d[@"value"];
        v.des = d[@"des"];
        [arr addObject:v];
    }
    if (arr.count > 0) {
        p.values = arr.copy;
    }
    return p;
}
@end


