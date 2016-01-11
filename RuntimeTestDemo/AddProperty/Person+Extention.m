//
//  Person+Extention.m
//  RuntimeTestDemo
//
//  Created by shancheli on 16/1/8.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "Person+Extention.h"

#import <objc/runtime.h>

@implementation Person (Extention)

//定义常量 必须是C语言字符串
static char *PersonNameKey = "PersonNameKey";

-(void)setName:(NSString *)name{
    /*
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     */
    objc_setAssociatedObject(self, PersonNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}


-(NSString *)name{
    return objc_getAssociatedObject(self, PersonNameKey);
}

//-(void)removeName{
//    
//    objc_removeAssociatedObjects(<#id object#>)
//}


-(void)saySex{
    NSLog(@"%s----%@",__func__,self);
}


/*************************************
 *优点：这种方式能够使我们快速的在一个已有的class内部添加一个动态属性或block块。
 
 *缺点：不能像遍历属性一样的遍历我们所有关联对象，且不能移除制定的关联对象，只能通过removeAssociatedObjects方法移除所有关联对象。
***********************/


//在目标target上添加关联对象，属性名propertyname(也能用来添加block)，值value
+ (void)addAssociatedWithtarget:(id)target withPropertyName:(NSString *)propertyName withValue:(id)value
{
    
    id property = objc_getAssociatedObject(target, &propertyName);
    if(property == nil)
    {
        property = value;
        objc_setAssociatedObject(target, &propertyName, property, OBJC_ASSOCIATION_RETAIN);
    }
}

//获取目标target的指定关联对象值
+ (id)getAssociatedValueWithTarget:(id)target withPropertyName:(NSString *)propertyName
{
    id property = objc_getAssociatedObject(target, &propertyName);
    
    return property;
}

@end
