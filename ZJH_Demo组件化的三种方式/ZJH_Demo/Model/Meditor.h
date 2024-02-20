//
//  Meditor.h
//  ZJH_Demo
//
//  Created by keloopA on 2024/2/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol DetailViewControllerProtocol <NSObject>

+ (void)showDetail;

@end


@interface Meditor : NSObject

# pragma mark - TargetAction
/**
 缺点：目标控制器的类名硬编码
 */
+ (UIViewController*)detailViewController;


# pragma mark - URLScheme
/**
 缺点：scheme硬编码；需要先在目标控制器的load方法中调用register方法；需要实现两个函数，且创建一个缓存池；
 */
+ (void)registerSchme:(NSString*)scheme WithHandler:(void(^)(void))handler;
+ (void)openDetailVCWithSchem:(NSString*)scheme;

# pragma mark - Protocol Class
/**
 优点：没有硬编码
 缺点：复杂，需要在中转类中编写protocol；在目标控制器中遵从该protocol；在load方法中调用register方法，且创建一个缓存池；
 */
+ (void)registerProtocol:(Protocol*)protocol andClass:(Class)cls;
+ (Class)getClassWithProtocol:(Protocol*)protocol;

@end

NS_ASSUME_NONNULL_END
