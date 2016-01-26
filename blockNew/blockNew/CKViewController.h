//
//  CKViewController.h
//  blockNew
//
//  Created by user on 16/1/26.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKPerson.h"

typedef void (^sendBlock)(CKPerson *person);

@interface CKViewController : UIViewController

@property (nonatomic,copy) sendBlock block;

@property (nonatomic,copy) void (^secondBlock) (CKPerson *person);

@end
