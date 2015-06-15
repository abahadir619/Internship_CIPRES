//
//  APPDetailViewController2.m
//  CIPRES APP
//
//  Created by SDSC on 4/20/15.
//  Copyright (c) 2015 SDSC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APPMasterViewController2.h"
#import "APPDetailViewController2.h"
#import "ViewController.h"

@implementation APPDetailViewController

#pragma mark - Managing the detail item

@synthesize webView;
@synthesize textView;
@synthesize string;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"You want the data for the job url: ");
    NSLog(self.url);
    
    NSLog(@"The user name is ");
    NSLog(self.usr);
    NSLog(@"The pass is ");
    NSLog(self.pass);
    
    // Set up the authentication variables
    USR = self.usr;
    PWD = self.pass;
    APPKEY= @"Test2-5C8978C1ECF443E5AB1D1E037C684AE5";
    
    // Set up the job url (MUST REMOVE NEWLINE AND WHITESPACE CHARACTERS FROM END)
    NSString *joburl = [self.url stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // Create the url string for the HTTP request, using the job url
    NSString *urlstring = [NSString stringWithFormat: @"https://cipresrest.sdsc.edu/cipresrest/v1/job/abl012/%@", joburl];
    // Creat the NSURL object
    URL = [NSURL URLWithString: urlstring];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    // Pass in authentication values
    NSString *loginString = [NSString stringWithFormat:@"%@:%@",USR,PWD];
    NSData *authData = [loginString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod: @"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:APPKEY forHTTPHeaderField: @"cipres-appkey"];
    // Execute HTTP request and receive response
    NSError *error = nil;
    NSURLResponse *response;
    // Process the data and display it in the textview 
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    self.textView.text = data;
}

@end