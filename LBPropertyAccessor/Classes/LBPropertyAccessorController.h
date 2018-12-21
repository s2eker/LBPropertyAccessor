//
//  LBPropertyAccessorController.h
//  LBPropertyAccessor
//
//  Created by 李兵 on 2018/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBPropertyAccessorController : UIViewController

+ (instancetype)instanceWithObj:(id)obj properties:(NSArray *)properties;

@end

NS_ASSUME_NONNULL_END
