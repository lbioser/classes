#import "NSDictionary+ZBCrash.h"
#import "NSObject+ZBSwizzle.h"

@implementation NSDictionary (ZBCrash)


+ (void)zb_enableDictionaryProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // __NSPlaceholderDictionary
        [self zb_classSwizzleMethodWithClass:self orginalMethod:@selector(dictionaryWithObjects:forKeys:count:) replaceMethod:@selector(zb_dictionaryWithObjects:forKeys:count:)];
    });
}

+ (instancetype)zb_dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    
    id instance = nil;
    @try {
        instance = [self zb_dictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self zb_dictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}

@end
