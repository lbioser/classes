//
//  CrashKiller.m
//  Deni
//
//  Created by keloopA on 2024/3/16.
//

#import "CrashKiller.h"
#import "NSObject+SelectorCrash.h"
#import "NSNull+SafeNull.h"

#import "NSString+ZBCrash.h"
#import "NSMutableString+ZBCrash.h"
#import "NSArray+ZBCrash.h"
#import "NSMutableArray+ZBCrash.h"
#import "NSAttributedString+ZBCrash.h"
#import "NSMutableAttributedString+ZBCrash.h"
#import "NSDictionary+ZBCrash.h"
#import "NSMutableDictionary+ZBCrash.h"

#import "NSObject+NSNotificationCrash.h"
@implementation CrashKiller

+ (void)start {
    [NSObject zb_enableSelectorProtector];
    [NSString zb_enableStringProtector];
    [NSMutableString zb_enableMutableStringProtector];
    [NSArray zb_enableArrayProtector];
    [NSMutableArray zb_mEnableMutableArrayProtector];
    [NSAttributedString zb_enableAttributedStringProtector];
    [NSMutableAttributedString zb_enableMutableAttributedStringProtector];
    [NSDictionary zb_enableDictionaryProtector];
    [NSMutableDictionary zb_enableMutableDictionaryProtector];
    [NSObject zb_enableNotificationProtector];
}

@end
