#import "NSString+ZBCrash.h"
#import "NSObject+ZBSwizzle.h"

@implementation NSString (ZBCrash)


+ (void)zb_enableStringProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSCFConstantString = NSClassFromString(@"__NSCFConstantString");
        
        //substringFromIndex
        [self zb_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringFromIndex:) replaceMethod:@selector(zb_substringFromIndex:)];
        
        //substringToIndex
        [self zb_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringToIndex:) replaceMethod:@selector(zb_substringToIndex:)];
        
        //substringWithRange:
        [self zb_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringWithRange:) replaceMethod:@selector(zb_substringWithRange:)];
        
        //characterAtIndex
        [self zb_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(characterAtIndex:) replaceMethod:@selector(zb_characterAtIndex:)];
        
        /* 注意swizzling先后顺序 👇： */
        //stringByReplacingOccurrencesOfString:withString:options:range:
        [self zb_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) replaceMethod:@selector(zb_stringByReplacingOccurrencesOfString:withString:options:range:)];

        //stringByReplacingCharactersInRange:withString:
        [self zb_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(stringByReplacingCharactersInRange:withString:) replaceMethod:@selector(zb_stringByReplacingCharactersInRange:withString:)];
    });
}


#pragma mark - characterAtIndex:

- (unichar)zb_characterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self zb_characterAtIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return characteristic;
    }
}

#pragma mark - substringFromIndex:

- (NSString *)zb_substringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self zb_substringFromIndex:from];
    }
    @catch (NSException *exception) {
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - substringToIndex
- (NSString *)zb_substringToIndex:(NSUInteger)index {
    
    NSString *subString = nil;
    
    @try {
        subString = [self zb_substringToIndex:index];
    }
    @catch (NSException *exception) {
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)zb_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self zb_stringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

- (NSString *)zb_stringByReplacingOccurrencesOfString:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self zb_stringByReplacingOccurrencesOfString:range withString:replacement];
    }
    @catch (NSException *exception) {
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)zb_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self zb_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - substringWithRange:
- (NSString *)zb_substringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self zb_substringWithRange:range];
    }
    @catch (NSException *exception) {
        subString = nil;
    }
    @finally {
        return subString;
    }
}

@end
