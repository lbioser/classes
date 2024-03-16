//
//  Created by 李宗兵 on 2021/7/26.
//

#import "NSObject+ZBSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (ZBSwizzle)

/**
 对类方法进行拦截并替换
 
 @param originalSelector 类原有方法
 @param replaceSelector 自定义替换方法
 */
+ (void)zb_classSwizzleMethod:(SEL _Nonnull)originalSelector replaceMethod:(SEL _Nonnull)replaceSelector {
    Class class = [self class];
    
    [self zb_classSwizzleMethodWithClass:class orginalMethod:originalSelector replaceMethod:replaceSelector];
}

/**
 对类方法进行拦截并替换
 
 @param kClass 具体的类
 @param originalSelector 原有类方法
 @param replaceSelector 自定义类替换方法
 */
+ (void)zb_classSwizzleMethodWithClass:(Class _Nonnull)kClass orginalMethod:(SEL _Nonnull)originalSelector replaceMethod:(SEL _Nonnull)replaceSelector {
    
    // Method中包含IMP函数指针，通过替换IMP，使SEL调用不同函数实现
    Method originalMethod = class_getClassMethod(kClass, originalSelector);
    Method replaceMethod = class_getClassMethod(kClass, replaceSelector);
    
    // 获取MetaClass (交换、添加等类方法需要用metaClass)
    Class metaClass = objc_getMetaClass(NSStringFromClass(kClass).UTF8String);
    
    // class_addMethod:如果发现方法已经存在，会失败返回，也可以用来做检查用,我们这里是为了避免源方法没有实现的情况;如果方法没有存在,我们则先尝试添加被替换的方法的实现
    BOOL didAddMethod = class_addMethod(metaClass, originalSelector, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod));
    
    if (didAddMethod) {
        // 添加成功（原方法未实现，为防止crash，需要将刚添加的原方法替换）
        class_replaceMethod(metaClass, replaceSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        // 添加失败（原本就有原方法, 直接交换两个方法）
        method_exchangeImplementations(originalMethod, replaceMethod);
    }
}


/**
 对实例方法进行拦截并替换
 
 @param originalSelector 原有实例方法
 @param replaceSelector 自定义实例替换方法
 */
- (void)zb_instanceSwizzleMethod:(SEL _Nonnull)originalSelector replaceMethod:(SEL _Nonnull)replaceSelector {
    Class class = [self class];
    
    [self zb_instanceSwizzleMethodWithClass:class orginalMethod:originalSelector replaceMethod:replaceSelector];
}

/**
 对实例方法进行拦截并替换
 
 @param kClass 具体的类
 @param originalSelector 原有实例方法
 @param replaceSelector 自定义实例替换方法
 */
- (void)zb_instanceSwizzleMethodWithClass:(Class _Nonnull)kClass orginalMethod:(SEL _Nonnull)originalSelector replaceMethod:(SEL _Nonnull)replaceSelector {
    
    Method originalMethod = class_getInstanceMethod(kClass, originalSelector);
    Method replaceMethod = class_getInstanceMethod(kClass, replaceSelector);
    
    // class_addMethod:如果发现方法已经存在，会失败返回，也可以用来做检查用,我们这里是为了避免源方法没有实现的情况;如果方法没有存在,我们则先尝试添加被替换的方法的实现
    BOOL didAddMethod = class_addMethod(kClass, originalSelector, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod));
    
    if (didAddMethod) {
        // 添加成功（原方法未实现，为防止crash，需要将刚添加的原方法替换）
        class_replaceMethod(kClass, replaceSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        // 添加失败（原本就有原方法, 直接交换两个方法）
        method_exchangeImplementations(originalMethod, replaceMethod);
    }
}



@end
