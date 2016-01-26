//
//  ViewController.m
//  blockNew
//
//  Created by user on 16/1/26.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "CKViewController.h"
#import "CKPerson.h"

@interface ViewController ()
{
    UITextView *textView;
}

@property (nonatomic,assign) int n;

@property (nonatomic,strong) NSString *str;

@property (nonatomic,strong) CKPerson *person;

@end

@implementation ViewController
int m = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 100)];
    
    [self.view addSubview:textView];
    
    self.n = 0;
    
    //
    __block int i = 0;
    //栈区
    NSLog(@"%@",^{NSLog(@"%d",i);});
    
    NSLog(@"%@\n\n\n\n",^{NSLog(@"%@",self.nibName);});
    
    //堆区
    void (^testBlock)() = ^{
        NSLog(@"%d",i);
    };
    
    NSLog(@"%@\n\n\n\n",testBlock);
    
    //局部变量
    //block会拷贝该变量的值当做常量使用，外界修改变量的值不会影响block内部，且block内部不能对其修改,在int i 之前加修饰__block可以修改局部变量的值
    void (^testBlock1)() = ^{
        NSLog(@"block内部的i的值为：%d\n\n\n",++i);
    };
    
    i++;
    NSLog(@"外部的i值大小为：%d",i);
    
    testBlock1();
    
    //静态变量、全局变量、成员属性\变量
    //block直接访问变量地址，在block内部可以修改变量的值，并且外部变量被修改后，block内部也会跟着变
    static int j=0;
    
    void (^testBlock2)() = ^{
        j++;
        m++;
        self.n++;
        
        NSLog(@"block中：%d,%d,%d,%@",j,m,self.n,self.person);
    };
    
    j++;
    m++;
    self.n++;
    
    NSLog(@"block外部：%d,%d,%d",j,m,self.n);
    
    testBlock2();
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    CKViewController *vc = [[CKViewController alloc] init];
    
    vc.block = ^(CKPerson *person){
        textView.text = person.name;
    };
    
    vc.secondBlock = ^(CKPerson *person){
        
    };
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
