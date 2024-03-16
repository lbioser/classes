#import "NSAttributedString+ZBCrash.h"
#import "NSObject+ZBSwizzle.h"

@implementation NSAttributedString (ZBCrash)


+ (void)zb_enableAttributedStringProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        //initWithString:
        [self zb_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithString:) replaceMethod:@selector(zb_initWithString:)];
        //initWithAttributedString
        [self zb_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithAttributedString:) replaceMethod:@selector(zb_initWithAttributedString:)];

        //initWithString:attributes:
        [self zb_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithString:attributes:) replaceMethod:@selector(zb_initWithString:attributes:)];
    });
}


- (instancetype)zb_initWithString:(NSString *)str {
    id object = nil;
    
    @try {
        object = [self zb_initWithString:str];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}

#pragma mark - initWithAttributedString
- (instancetype)zb_initWithAttributedString:(NSAttributedString *)attrStr {
    id object = nil;
    
    @try {
        object = [self zb_initWithAttributedString:attrStr];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}

#pragma mark - initWithString:attributes:

- (instancetype)zb_initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs {
    id object = nil;
    
    @try {
        object = [self zb_initWithString:str attributes:attrs];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}

@end
