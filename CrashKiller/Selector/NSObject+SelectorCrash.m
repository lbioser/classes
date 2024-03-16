//
//  NSObject+SelectorCrash.m
//  learnOC
//
//  Created by 李宗兵 on 2021/7/31.
//

#import "NSObject+SelectorCrash.h"
#import <objc/runtime.h>
#import "NSObject+ZBSwizzle.h"
#import "ZBUnrecognizedSelectorSolveObject.h"

@implementation NSObject (SelectorCrash)

+ (void)zb_enableSelectorProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSObject *object = [[NSObject alloc] init];
        [object zb_instanceSwizzleMethod:@selector(forwardingTargetForSelector:) replaceMethod:@selector(xz_forwardingTargetForSelector:)];
    });
}

- (id)xz_forwardingTargetForSelector:(SEL)aSelector {
    // 判断某个类是否有某个实例方法，有则返回YES，否则返回NO
    if (class_respondsToSelector([self class], @selector(forwardInvocation:))) {
        // 有forwardInvocation实例方法
        IMP impOfNSObject = class_getMethodImplementation([NSObject class], @selector(forwardInvocation:));
        IMP imp = class_getMethodImplementation([self class], @selector(forwardInvocation:));
        
        if (imp != impOfNSObject) {
            return nil;
        }
    }
    
    // 新建桩类转发消息
    ZBUnrecognizedSelectorSolveObject *solveObject = [ZBUnrecognizedSelectorSolveObject new];
    solveObject.objc = self;
    return solveObject;
}

@end
