//
//  NSObject+SelectorCrash.h
//  learnOC
//
//  Created by 李宗兵 on 2021/7/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SelectorCrash)

+ (void)zb_enableSelectorProtector;

@end

NS_ASSUME_NONNULL_END
