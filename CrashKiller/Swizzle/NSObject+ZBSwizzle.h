
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZBSwizzle)

/**
 对类方法进行拦截并替换
 
 @param originalSelector 原有类方法
 @param replaceSelector 自定义类替换方法
 */
+ (void)zb_classSwizzleMethod:(SEL _Nonnull)originalSelector replaceMethod:(SEL _Nonnull)replaceSelector;

/**
 对类方法进行拦截并替换
 
 @param kClass 具体的类
 @param originalSelector 原有类方法
 @param replaceSelector 自定义类替换方法
 */
+ (void)zb_classSwizzleMethodWithClass:(Class _Nonnull)kClass orginalMethod:(SEL _Nonnull)originalSelector replaceMethod:(SEL _Nonnull)replaceSelector;



/**
 对实例方法进行拦截并替换
 
 @param originalSelector 原有实例方法
 @param replaceSelector 自定义实例替换方法
 */
- (void)zb_instanceSwizzleMethod:(SEL _Nonnull)originalSelector replaceMethod:(SEL _Nonnull)replaceSelector;

/**
 对实例方法进行拦截并替换
 
 @param kClass 具体的类
 @param originalSelector 原有实例方法
 @param replaceSelector 自定义实例替换方法
 */
- (void)zb_instanceSwizzleMethodWithClass:(Class _Nonnull)kClass orginalMethod:(SEL _Nonnull)originalSelector replaceMethod:(SEL _Nonnull)replaceSelector;


@end

NS_ASSUME_NONNULL_END
