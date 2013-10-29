//
//  SMSDependencyContainer.h
//  SMSDependencyContainer
//
//  Created by Tony Merante on 10/26/13.
//  Copyright (c) 2013 Societymedia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SMSDependencyContainerScope) {
    SMSDependencyContainerScopeSingleton     = 0,
    SMSDependencyContainerScopeTransient     = 1
};

typedef id (^SMSDependencyContainerHandler)(void);

@interface SMSDependencyContainer : NSObject
+ (instancetype)sharedInstance;
- (id)resolve:(Protocol *)protocol forClass:(Class)class;
- (id)resolve:(Protocol *)protocol;
- (void)bindToProtocol:(Protocol *)protocol withClass:(Class)class inScope:(SMSDependencyContainerScope)scope;
//- (void)initWithBindings:(NSDictionary *)bindings;
@end
