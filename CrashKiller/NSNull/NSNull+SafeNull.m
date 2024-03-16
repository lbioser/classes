//
//  NSNull+SafeNull.m
//  polymerize
//
//  Created by 李宗兵 on 2022/1/12.
//

#import "NSNull+SafeNull.h"
#import <objc/message.h>
#define NSNullObjectsArr @[@"", @0, @{}, @[]]
@implementation NSNull (SafeNull)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (NSObject *obj in NSNullObjectsArr) {
            signature = [obj methodSignatureForSelector:aSelector];
            if (signature) {
                break;
            }
        }
    }
    return signature;
}
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    for (NSObject *objc in NSNullObjectsArr) {
        if ([objc respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:objc];
            return;
        }
    }
}

@end
