//
//  Meditor.m
//  ZJH_Demo
//
//  Created by keloopA on 2024/2/20.
//

#import "Meditor.h"

@interface Meditor ()
@property(nonatomic,strong,class,readonly)NSMutableDictionary* cacheSchemeDict;
@property(nonatomic,strong,class,readonly)NSMutableDictionary* cacheProtocolDict;
@end

@implementation Meditor

+ (UIViewController*)detailViewController{
    Class cls = NSClassFromString(@"DetailViewController");
    UIViewController* vc = [[cls alloc] init];
    return vc;
}

+ (NSMutableDictionary *)cacheSchemeDict{
        static NSMutableDictionary* cacheDict;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cacheDict = [NSMutableDictionary dictionary];
        });
        return cacheDict;
}
+ (NSMutableDictionary *)cacheProtocolDict{
        static NSMutableDictionary* cacheDict;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cacheDict = [NSMutableDictionary dictionary];
        });
        return cacheDict;
}
//+ (NSMutableDictionary*)cacheSchme {
//    static NSMutableDictionary* cacheDict;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        cacheDict = [NSMutableDictionary dictionary];
//    });
//    return cacheDict;
//}

+ (void)registerSchme:(NSString*)scheme WithHandler:(void(^)(void))handler{
    if(scheme && handler){
        [Meditor.cacheSchemeDict setObject:handler forKey:scheme];
    }
}
+ (void)openDetailVCWithSchem:(NSString*)scheme{
    void(^block)(void) = [Meditor.cacheSchemeDict valueForKey:scheme];
    if(block){
        block();
    }
}


+ (void)registerProtocol:(Protocol*)protocol andClass:(Class)cls{
    [Meditor.cacheProtocolDict setValue:cls forKey:NSStringFromProtocol(protocol)];
}
+ (Class)getClassWithProtocol:(Protocol*)protocol{
    return [Meditor.cacheProtocolDict valueForKey:NSStringFromProtocol(protocol)];
}

@end
