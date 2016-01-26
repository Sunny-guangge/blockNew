//
//  CKViewController.m
//  blockNew
//
//  Created by user on 16/1/26.
//  Copyright © 2016年 user. All rights reserved.
//

#import "CKViewController.h"

@interface CKViewController ()

@property (nonatomic,strong) UITextField *textField;

@end

@implementation CKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
    self.textField.placeholder = @"请输入内容";
    [self.view addSubview:self.textField];
    
    
    //造成循环引用的解决方法
    __weak typeof (self) weakSelf = self;
    
    self.block = ^(CKPerson *person){
        NSLog(@"会不会造成循环引用%@",weakSelf.textField.text);
    };
}

- (void)dealloc
{
    NSLog(@"控制器销毁了！");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    CKPerson *person = [[CKPerson alloc] init];
    person.name = self.textField.text;
    self.block(person);
    
    self.secondBlock(person);
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
