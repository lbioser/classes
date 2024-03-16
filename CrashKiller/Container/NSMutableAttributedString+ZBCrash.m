#import "NSMutableAttributedString+ZBCrash.h"
#import "NSObject+ZBSwizzle.h"

@implementation NSMutableAttributedString (ZBCrash)


+ (void)zb_enableMutableAttributedStringProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteMutableAttributedString = NSClassFromString(@"NSConcreteMutableAttributedString");
        
        //initWithString:
        [self zb_instanceSwizzleMethodWithClass:NSConcreteMutableAttributedString orginalMethod:@selector(initWithString:) replaceMethod:@selector(zb_initWithString:)];

        //initWithString:attributes:
        [self zb_instanceSwizzleMethodWithClass:NSConcreteMutableAttributedString orginalMethod:@selector(initWithString:attributes:) replaceMethod:@selector(zb_initWithString:attributes:)];
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
