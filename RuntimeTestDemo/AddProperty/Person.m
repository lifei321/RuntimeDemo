//
//  Person.m
//  RuntimeTestDemo
//
//  Created by shancheli on 16/1/8.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>


@interface Person ()

{
    NSString* _privateName;
}


@end

@implementation Person



-(id)init
{
    self = [super init];
    
    if (self)_privateName = @"Steve";
    
    return self;
}


NSString *nameGetter(id self, SEL _cmd)
{
    Ivar ivar = class_getInstanceVariable([Person class], "_privateName");
    
    return object_getIvar(self, ivar);
    
}
void nameSetter(id self, SEL _cmd, NSString *newName)
{
    
    Ivar ivar = class_getInstanceVariable([Person class], "_privateName");
    
    id oldName = object_getIvar(self, ivar);
    
    if (oldName != newName) object_setIvar(self, ivar, [newName copy]);
    
}



-(void)run{
    NSLog(@"%s",__func__);
}

@end
