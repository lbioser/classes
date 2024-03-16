#import "NSMutableString+ZBCrash.h"
#import "NSObject+ZBSwizzle.h"

@implementation NSMutableString (ZBCrash)


+ (void)zb_enableMutableStringProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSCFString = NSClassFromString(@"__NSCFString");
        
        //substringFromIndex
        [self zb_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(substringFromIndex:) replaceMethod:@selector(zb_substringFromIndex:)];
        
        //substringToIndex
        [self zb_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(substringToIndex:) replaceMethod:@selector(zb_substringToIndex:)];
        
        //substringWithRange:
        [self zb_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(substringWithRange:) replaceMethod:@selector(zb_substringWithRange:)];
        
        //characterAtIndex
        [self zb_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(characterAtIndex:) replaceMethod:@selector(zb_characterAtIndex:)];
        
        //replaceCharactersInRange
        [self zb_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(replaceCharactersInRange:withString:) replaceMethod:@selector(zb_replaceCharactersInRange:withString:)];
        
        //insertString:atIndex:
        [self zb_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(insertString:atIndex:) replaceMethod:@selector(zb_insertString:atIndex:)];

        //deleteCharactersInRange
        [self zb_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(deleteCharactersInRange:) replaceMethod:@selector(zb_deleteCharactersInRange:)];
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


#pragma mark - replaceCharactersInRange
- (void)zb_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    @try {
        [self zb_replaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

#pragma mark - insertString:atIndex:
- (void)zb_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self zb_insertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

#pragma mark - deleteCharactersInRange

- (void)zb_deleteCharactersInRange:(NSRange)range {
    
    @try {
        [self zb_deleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
}

@end
