//
//  ExChangeMethodController.m
//  RuntimeTestDemo
//
//  Created by shancheli on 16/1/11.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "ExChangeMethodController.h"

#import "NSArray+Swizzle.h"
#import <objc/runtime.h>

@interface ExChangeMethodController ()

@property(nonatomic,copy)NSString* name;

@property(nonatomic,copy)NSString* sex;

@end

@implementation ExChangeMethodController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"交换方法" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClickExChangeMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton* btn1 = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 setTitle:@"属性列表" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnDidClickProperty) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}


-(void)btnDidClickExChangeMethod
{
    NSArray *array = @[@"0",@"1",@"2",@"3"];
    NSString *string = [array lastObject];
    NSLog(@"TEST RESULT : %@",string);
}

-(void)btnDidClickProperty
{
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property------>%@",[NSString stringWithUTF8String:propertyName]);
    }
    //获取方法列表
    
}

@end
