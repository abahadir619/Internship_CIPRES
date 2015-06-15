//
//  ViewController.h
//  CIPRES APP
//
//  Created by SDSC on 3/30/15.
//  Copyright (c) 2015 SDSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Foundation;

@interface ViewController : UIViewController{
    IBOutlet UILabel *label;
    NSString *USR;
    NSString *PWD;
    NSString *APPKEY;
    NSURL *URL;
}

- (IBAction)buttonTapped:(UIButton *)sender;
- (IBAction)buttonTapped2:(UIButton *)sender;
- (IBAction)submitCredentialsTapped:(UIButton *)sender;

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UITextView *textview;
@property (nonatomic, retain) IBOutlet UITextView *textview2;
@property (nonatomic, retain) IBOutlet UITextView *usertext;
@property (nonatomic, retain) IBOutlet UITextView *passtext;
@property (nonatomic, retain) NSString *response;
@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, strong) NSMutableArray *arrJobData;
@property (nonatomic, strong) NSMutableDictionary *dictTempDataStorage;
@property (nonatomic, strong) NSMutableString *foundValue;
@property (nonatomic, strong) NSString *currentElement;
@end

