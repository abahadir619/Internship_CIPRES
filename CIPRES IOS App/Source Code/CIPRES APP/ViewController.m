//
//  ViewController.m
//  CIPRES APP
//
//  Created by SDSC on 3/30/15.
//  Copyright (c) 2015 SDSC. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "APPMasterViewController2.h"

@implementation ViewController;

@synthesize label;
@synthesize textview;
@synthesize textview2;
@synthesize usertext;
@synthesize passtext;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) viewDidLoad{
    [super viewDidLoad];
}



- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // Send an HTTP request that will get the list of jobs of the user
    
    
}

- (IBAction)buttonTapped:(UIButton *)sender
{
    // Performt the HTTP Get Request to list all jobs
    NSLog(@"You have listed your jobs!!");
    USR = @"abl012";
    PWD = @"hello1";
    APPKEY = @"Test2-5C8978C1ECF443E5AB1D1E037C684AE5";
    URL = [NSURL URLWithString: @"https://cipresrest.sdsc.edu/cipresrest/v1/job/abl012"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString *loginString = [NSString stringWithFormat:@"%@:%@",USR,PWD];
    NSData *authData = [loginString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod: @"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:APPKEY forHTTPHeaderField: @"cipres-appkey"];
    NSError *error = nil;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    textview.text = data;
    NSLog(@"The data is \n");
    NSLog(data);
    
}

- (IBAction)buttonTapped2:(UIButton *) sender
{
    USR = @"abl012";
    PWD = @"hello1";
    APPKEY= @"Test2-5C8978C1ECF443E5AB1D1E037C684AE5";
    NSString* urlstring = [NSString stringWithFormat: @"https://cipresrest.sdsc.edu/cipresrest/v1/job/abl012/%@", textview2.text];
    URL = [NSURL URLWithString: urlstring];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString *loginString = [NSString stringWithFormat:@"%@:%@",USR,PWD];
    NSData *authData = [loginString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod: @"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:APPKEY forHTTPHeaderField: @"cipres-appkey"];
    NSError *error = nil;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    textview.text = data;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    @try{
    if ([[segue identifier] isEqualToString:@"showMaster"]) {
        //[[segue destinationViewController] setUrl: usertext.text];
      //  [[segue destinationViewController] setUsr: usertext.text];
      //  [[segue destinationViewController] setPass: passtext.text];
        
        APPMasterViewController *destViewController =
        (APPMasterViewController*)[[segue destinationViewController] topViewController];
        destViewController.usr = usertext.text;
        destViewController.pass = passtext.text;
        
      //  NSLog(destViewController.description);
        NSLog(@"Segue source view controller: %@", [segue sourceViewController] );
        NSLog(@"Segue dest view controller: %@", destViewController.description );
        NSLog([segue identifier]);
        NSLog(passtext.text);
        NSLog(usertext.text);
    }}
    @catch(NSException* e){
        NSLog(e);
    }
}

@end
