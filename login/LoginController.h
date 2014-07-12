//
//  LoginController.h
//  login
//
//  Created by Leoc O'Cear on 14-7-11.
//  Copyright (c) 2014年 Leoc O'Cear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;
- (IBAction)loginClick:(id)sender;

- (IBAction)backgroundTap:(id)sender;

@end
