//
//  AddPropertyController.m
//  RuntimeTestDemo
//
//  Created by shancheli on 16/1/8.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "AddPropertyController.h"

#import <objc/runtime.h>

#import "Person.h"
#import "Person+Extention.h"

@interface AddPropertyController ()

@end

@implementation AddPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    Person* person = [[Person alloc]init];
    person.age = 10;
    
    person.name = @"zll";
    
}



@end
