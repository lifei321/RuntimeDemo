//
//  AddMethodController.m
//  RuntimeTestDemo
//
//  Created by shancheli on 16/1/11.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "AddMethodController.h"

#import "PersonModel.h"

@interface AddMethodController ()

@end

@implementation AddMethodController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    PersonModel *personModel = [[PersonModel alloc] init];
    
    //    //消息转发  resolveInstanceMethod
    personModel.name = @"Jim Green";
    NSString *name = personModel.name;
    NSLog(@"%@", name);
    
    
    //消息转发 forwardingTargetForSelector
    NSString *name1 = [personModel companyName];
    NSLog(@"%@", name1);
    
    //    //消息转发 forwardInvocation
    NSString *name2 = [personModel deptName];
    NSLog(@"%@", name2);
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
