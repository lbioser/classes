/**
 
 iOS 8:下都是__NSArrayI
 iOS11: 之后分 __NSArrayI、  __NSArray0、__NSSingleObjectArrayI
 
 iOS11之前：arr@[]  调用的是[__NSArrayI objectAtIndexed]
 iOS11之后：arr@[]  调用的是[__NSArrayI objectAtIndexedSubscript]
 
 arr为空数组
 *** -[__NSArray0 objectAtIndex:]: index 12 beyond bounds for empty NSArray
 
 arr只有一个元素
 *** -[__NSSingleObjectArrayI objectAtIndex:]: index 12 beyond bounds [0 .. 0]
 
 */

#import "NSArray+ZBCrash.h"
#import "NSObject+ZBSwizzle.h"
#import <objc/runtime.h>

@implementation NSArray (ZBCrash)

+ (void)zb_enableArrayProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        /**
         __NSArray0 仅仅初始化后不含有元素的数组          ( NSArray *arr2 =  [[NSArray alloc]init]; )
         __NSSingleObjectArrayI 只有一个元素的数组      ( NSArray *arr3 =  [[NSArray alloc]initWithObjects: @"1",nil]; )
         __NSPlaceholderArray 占位数组                ( NSArray *arr4 =  [NSArray alloc]; )
         __NSArrayI 初始化后的不可变数组                ( NSArray *arr1 =  @[@"1",@"2"]; )
         */
        Class __NSArray = objc_getClass("NSArray");
        Class __NSArrayI = objc_getClass("__NSArrayI");
        Class __NSSingleObjectArrayI = objc_getClass("__NSSingleObjectArrayI");
        Class __NSArray0 = objc_getClass("__NSArray0");
        
        
        [self zb_classSwizzleMethodWithClass:__NSArray orginalMethod:@selector(arrayWithObjects:count:) replaceMethod:@selector(zb_arrayWithObjects:count:)];
        
        
        // [arr objectAtIndex:];
        [self zb_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(zb_objectAtIndex:)];
        
        // arr[];
        [self zb_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(zb_objectAtIndexedSubscript:)];
        
        // 数组为空
        [self zb_instanceSwizzleMethodWithClass:__NSArray0 orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(zb_objectAtIndexedNullarray:)];
        
        // 数组count == 1
        [self zb_instanceSwizzleMethodWithClass:__NSSingleObjectArrayI orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(zb_objectAtIndexedArrayCountOnlyOne:)];
        
        // objectsAtIndexes:
        [self zb_instanceSwizzleMethodWithClass:__NSArray orginalMethod:@selector(objectsAtIndexes:) replaceMethod:@selector(zb_objectsAtIndexes:)];
        
        // 以下方法调用频繁，替换可能会影响性能
        // getObjects:range:
        [self zb_instanceSwizzleMethodWithClass:__NSArray orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(zb_getObjectsNSArray:range:)];
        [self zb_instanceSwizzleMethodWithClass:__NSSingleObjectArrayI orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(zb_getObjectsNSSingleObjectArrayI:range:)];
        [self zb_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(zb_getObjectsNSArrayI:range:)];
    });
}


// 创建类
+ (instancetype)zb_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    id instance = nil;
    
    @try {
        instance = [self zb_arrayWithObjects:objects count:cnt];
        
    } @catch (NSException *exception) {
        
        // 去掉nil的数据，用新数据重新初始化数组
        NSInteger newObjectsIndex = 0;
        id _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i ++) {
            if (objects[i] != nil) {
                newObjects[newObjectsIndex] = objects[i];
                newObjectsIndex ++;
            }
        }
        instance = [self zb_arrayWithObjects:newObjects count:newObjectsIndex];
        
    } @finally {
        return instance;
    }
}


- (id)zb_objectAtIndex:(NSUInteger)index {
    
    id object = nil;
    
    @try {
        object = [self zb_objectAtIndex:index];
        
    } @catch (NSException *exception) {
        
    } @finally {
        return object;
    }
}

- (id)zb_objectAtIndexedSubscript:(NSUInteger)index {
    
    id object = nil;
    
    @try {
        object = [self zb_objectAtIndexedSubscript:index];
        
    } @catch (NSException *exception) {
        
    } @finally {
        return object;
    }
}

- (id)zb_objectAtIndexedNullarray:(NSUInteger)index {
    
    id object = nil;
    
    @try {
        object = [self zb_objectAtIndexedNullarray:index];
        
    } @catch (NSException *exception) {
        
    } @finally {
        return object;
    }
}

- (id)zb_objectAtIndexedArrayCountOnlyOne:(NSUInteger)index {
    
    id object = nil;
    
    @try {
        object = [self zb_objectAtIndexedArrayCountOnlyOne:index];
        
    } @catch (NSException *exception) {
        
    } @finally {
        return object;
    }
}

- (NSArray *)zb_objectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    
    @try {
        returnArray = [self zb_objectsAtIndexes:indexes];
        
    } @catch (NSException *exception) {
        
    } @finally {
        return returnArray;
    }
}


#pragma mark getObjects:range:
- (void)zb_getObjectsNSArray:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self zb_getObjectsNSArray:objects range:range];
    } @catch (NSException *exception) {
    } @finally {
    }
}

- (void)zb_getObjectsNSSingleObjectArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self zb_getObjectsNSSingleObjectArrayI:objects range:range];
    } @catch (NSException *exception) {
    } @finally {
    }
}

- (void)zb_getObjectsNSArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self zb_getObjectsNSArrayI:objects range:range];
    } @catch (NSException *exception) {
    } @finally {
    }
}

@end
