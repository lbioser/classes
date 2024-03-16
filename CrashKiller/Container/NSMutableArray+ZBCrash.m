#import "NSMutableArray+ZBCrash.h"
#import "NSObject+ZBSwizzle.h"

@implementation NSMutableArray (ZBCrash)

+ (void)zb_mEnableMutableArrayProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSArrayM = NSClassFromString(@"__NSArrayM");
        
        // objectAtIndex:
        [self zb_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(zb_objectAtIndex:)];
        
        [self zb_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(zb_objectAtIndexedSubscript:)];
        
        //insertObject:atIndex:
        [self zb_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(insertObject:atIndex:) replaceMethod:@selector(zb_insertObject:atIndex:)];
        
        //removeObjectAtIndex:
        [self zb_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(removeObjectAtIndex:) replaceMethod:@selector(zb_removeObjectAtIndex:)];
        
        //setObject:atIndexedSubscript:
        [self zb_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(setObject:atIndexedSubscript:) replaceMethod:@selector(zb_setObject:atIndexedSubscript:)];
        
        [self zb_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(zb_getObjects:range:)];
    });
}


- (id)zb_objectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self zb_objectAtIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}

- (id)zb_objectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self zb_objectAtIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}

- (void)zb_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self zb_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

- (void)zb_removeObjectAtIndex:(NSUInteger)index {
    @try {
        [self zb_removeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

- (void)zb_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    @try {
        [self zb_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

- (void)zb_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self zb_getObjects:objects range:range];
    } @catch (NSException *exception) {
    } @finally {
    }
}

@end
