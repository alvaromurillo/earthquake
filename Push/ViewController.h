//
//  ViewController.h
//  Push
//
//  Created by Álvaro Murillo del Puerto on 02/07/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *magnitudeTextField;
@property (nonatomic, strong) IBOutlet UITextField *latitudeTextField;
@property (nonatomic, strong) IBOutlet UITextField *longitudeTextField;
@property (nonatomic, strong) IBOutlet UIButton *sendButton;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *spinner;

@end
