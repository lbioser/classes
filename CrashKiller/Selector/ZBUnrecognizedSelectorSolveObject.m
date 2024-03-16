//
//  ZBUnrecognizedSelectorSolveObject.m
//  learnOC
//
//  Created by 李宗兵 on 2021/7/31.
//

#import "ZBUnrecognizedSelectorSolveObject.h"
#import <objc/runtime.h>

@implementation ZBUnrecognizedSelectorSolveObject

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    // 如果没有动态添加方法的话，还会调用forwardingTargetForSelector:方法，从而造成死循环
    class_addMethod([self class], sel, (IMP)addMethod, "v@:@");
    return YES;
}

id addMethod(id self, SEL _cmd) {
    NSLog(@"WOCrashProtector: unrecognized selector: %@", NSStringFromSelector(_cmd));
    return 0;
}

@end
