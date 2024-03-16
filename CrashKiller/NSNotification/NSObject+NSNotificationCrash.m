//
//  Created by 李宗兵 on 2021/7/31.
//

#import "NSObject+NSNotificationCrash.h"
#import "NSObject+ZBSwizzle.h"
#import <objc/runtime.h>

static const char *isNSNotification = "isNSNotification";

@implementation NSObject (NSNotificationCrash)

+ (void)zb_enableNotificationProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSObject *objc = [[NSObject alloc] init];
        
        [objc zb_instanceSwizzleMethod:@selector(addObserver:selector:name:object:) replaceMethod:@selector(zb_addObserver:selector:name:object:)];
        
        // 在ARC环境下不能显示的@selector dealloc。
        [objc zb_instanceSwizzleMethod:NSSelectorFromString(@"dealloc") replaceMethod:NSSelectorFromString(@"zb_dealloc")];
    });
}

- (void)zb_addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject {
    
    // 添加标志位，在delloc中只有isNSNotification是YES，才会移除通知
    [observer setIsNSNotification:YES];
    [self zb_addObserver:observer selector:aSelector name:aName object:anObject];
}


- (void)setIsNSNotification:(BOOL)yesOrNo {
    objc_setAssociatedObject(self, isNSNotification, @(yesOrNo), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isNSNotification {
    NSNumber *number = objc_getAssociatedObject(self, isNSNotification);;
    return  [number boolValue];
}

/**
 如果一个对象从来没有添加过通知，那就不要remove操作
 */
- (void)zb_dealloc
{
    if ([self isNSNotification]) {
        NSLog(@"CrashProtector: %@ is dealloc，but NSNotificationCenter Also exsit",self);
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    
    [self zb_dealloc];
}

@end
