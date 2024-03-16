#import "NSMutableDictionary+ZBCrash.h"
#import "NSObject+ZBSwizzle.h"

@implementation NSMutableDictionary (ZBCrash)


+ (void)zb_enableMutableDictionaryProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [self  zb_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(setObject:forKey:) replaceMethod:@selector(zb_setObject:forKey:)];
        
        // iOS11
        [self zb_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(setObject:forKeyedSubscript:) replaceMethod:@selector(zb_setObject:forKeyedSubscript:)];
        
        
        //removeObjectForKey:
        [self zb_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(removeObjectForKey:) replaceMethod:@selector(zb_removeObjectForKey:)];
    });
}

- (void)zb_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self zb_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

- (void)zb_setObject:(id)anObject forKeyedSubscript:(id<NSCopying>)aKey {
    
    @try {
        [self zb_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

- (void)zb_removeObjectForKey:(id)aKey {
    
    @try {
        [self zb_removeObjectForKey:aKey];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

@end
