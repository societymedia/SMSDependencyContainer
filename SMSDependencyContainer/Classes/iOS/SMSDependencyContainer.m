//
//  SMSDependencyContainer.m
//  SMSDependencyContainer
//
//  Created by Tony Merante on 10/26/13.
//  Copyright (c) 2013 Societymedia. All rights reserved.
//

#import "SMSDependencyContainer.h"


@interface SMSDependencyContainer()
@property (nonatomic, strong) NSMutableDictionary *container;
@end

@implementation SMSDependencyContainer
typedef id (^SMSInstanceHandler)(void);


- (id)init
{
    self = [super init];
    if (self)
    {
        self.container =  [NSMutableDictionary dictionary];
    }

    return self;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static SMSDependencyContainer *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSString*)formatKey:(NSString*)protocolKey classKey:(NSString*)classKey
{
    return [NSString stringWithFormat:@"%@.%@", protocolKey, classKey];
}

- (id)resolve:(Protocol *)protocol forClass:(Class)class
{
    SMSDependencyContainerHandler block = [self.container objectForKey:[self formatKey:NSStringFromProtocol(protocol) classKey:NSStringFromClass(class)]];
    return block();
}
- (id)resolve:(Protocol *)protocol
{
    SMSDependencyContainerHandler block = [self.container objectForKey:[self formatKey:NSStringFromProtocol(protocol) classKey:NSStringFromClass([NSObject class])]];
    return block();
}

- (void)bindToProtocol:(Protocol *)protocol withClass:(Class)class inScope:(SMSDependencyContainerScope)scope
{
    NSAssert([class conformsToProtocol:protocol], @"class %@ does not conform to protocol %@", NSStringFromClass(class), NSStringFromProtocol(protocol));

    id object;
    if(scope == SMSDependencyContainerScopeSingleton){
        object = [[class alloc]init];
    }

    if([class conformsToProtocol:protocol]){
        [self.container setObject: ^id {

            if(scope == SMSDependencyContainerScopeSingleton){
                return object;
            }

            return [[class alloc]init];
        } forKey:[self formatKey:NSStringFromProtocol(protocol) classKey:NSStringFromClass(class)]];
    }
}


- (void)addObject:(id)instance {
    if(![self.container objectForKey:instance]){
        [self.container setObject:instance forKey:instance];
    }
}


@end
