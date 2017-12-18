//
//  MainController.m
//  RuntimeTestDemo
//
//  Created by shancheli on 16/1/8.
//  Copyright © 2016年 shancheli. All rights reserved.
//


//Runtime的作用
//1、创建、修改、自省classes和objects
//2、消息分发

//之前已经提过消息分发，不过这只是一小部分功能。所有的运行时方法都有特定的前缀。下面是一些有意思的方法：
//
//class
//
//class开头的方法是用来修改和自省classes。方法如class_addIvar, class_addMethod, class_addProperty和class_addProtocol允许重建classes。class_copyIvarList, class_copyMethodList, class_copyProtocolList和class_copyPropertyList能拿到一个class的所有内容。而class_getClassMethod, class_getClassVariable, class_getInstanceMethod, class_getInstanceVariable, class_getMethodImplementation和class_getProperty返回单个内容。
//
//也有一些通用的自省方法，如class_conformsToProtocol, class_respondsToSelector, class_getSuperclass。最后，你可以使用class_createInstance来创建一个object。
//
//ivar
//
//这些方法能让你得到名字，内存地址和Objective-C type encoding。
//
//method
//
//这些方法主要用来自省，比如method_getName, method_getImplementation, method_getReturnType等等。也有一些修改的方法，包括method_setImplementation和method_exchangeImplementations，这些我们后面会讲到。
//
//objc
//
//一旦拿到了object，你就可以对它做一些自省和修改。你可以get/set ivar, 使用object_copy和object_dispose来copy和free object的内存。最NB的不仅是拿到一个class，而是可以使用object_setClass来改变一个object的class。待会就能看到使用场景。
//
//property
//
//属性保存了很大一部分信息。除了拿到名字，你还可以使用property_getAttributes来发现property的更多信息，如返回值、是否为atomic、getter/setter名字、是否为dynamic、背后使用的ivar名字、是否为弱引用。
//
//protocol
//
//Protocols有点像classes，但是精简版的，运行时的方法是一样的。你可以获取method, property, protocol列表, 检查是否实现了其他的protocol。
//
//sel
//
//最后我们有一些方法可以处理 selectors，比如获取名字，注册一个selector等等。



// runtime的理解：
// oc是动态语言，所谓的动态语言就是指程序在运行时可以改变其结构：新的函数可以被引进，已有的函数可以被删除等在结构上的变化。的语言。因为它可以在程序执行过程中对类或者变量等等做操作，而不是代码写完了，程序就定型了。
// 而iOS中的runtime就是可以实现语言动态的一组API.
// 你可以理解：它就仅仅是一组API而已。


// runtime的所有知识基本都围绕两个中心（1）类的各个方面的动态配置（2）消息传递



#import "MainController.h"

#import "AddPropertyController.h"
#import "AddMethodController.h"
#import "ExChangeMethodController.h"

@interface MainController ()

@property(nonatomic,strong)NSMutableArray* dataSource;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Runtime";
    
    _dataSource = [NSMutableArray arrayWithObjects:@"动态添加属性",@"动态添加方法",@"交换方法", @"获取属性列表",nil];
    
    static NSString* cellID = @"cell";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
}






#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
        {
            AddPropertyController* vc = [[AddPropertyController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            
            break;
        case 1:
        {
            AddMethodController* vc = [[AddMethodController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 2:
        {
            ExChangeMethodController* vc = [[ExChangeMethodController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            ExChangeMethodController* vc = [[ExChangeMethodController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            
        }
            break;
            
        default:
            break;
    }
}


@end
