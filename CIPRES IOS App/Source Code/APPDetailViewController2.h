//
//  APPDetailViewController2.h
//  CIPRES APP
//
//  Created by SDSC on 4/20/15.
//  Copyright (c) 2015 SDSC. All rights reserved.
//

#ifndef CIPRES_APP_APPDetailViewController2_h
#define CIPRES_APP_APPDetailViewController2_h

#import <UIKit/UIKit.h>

@interface APPDetailViewController : UIViewController{
    NSString *USR;
    NSString *PWD;
    NSString *APPKEY;
    NSURL *URL;
}

@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *string;
@property (copy, nonatomic) NSString *pass;
@property (copy, nonatomic) NSString *usr;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@end

#endif
