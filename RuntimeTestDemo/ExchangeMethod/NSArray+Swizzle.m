//
//  NSArray+Swizzle.m
//  NSArraySwizzing
//
//  Created by yifan on 15/8/21.
//  Copyright (c) 2015年 黄成都. All rights reserved.
//

#import "NSArray+Swizzle.h"
#import <objc/runtime.h>

@implementation NSArray (Swizzle)

+(void)load
{
    Method ori_Method = class_getInstanceMethod([NSArray class], @selector(lastObject));
    Method my_Method = class_getInstanceMethod([NSArray class], @selector(myLastObject));
    //修改者两个方法的实现
    method_exchangeImplementations(ori_Method, my_Method);
}


-(id)myLastObject{
    //[self myLastObject] 将会执行真的 [self lastObject]
    id ret = [self myLastObject];
    NSLog(@"**********myLastObject************");
    return ret;
}
@end
