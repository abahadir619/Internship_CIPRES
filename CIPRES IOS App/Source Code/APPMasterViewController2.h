//
//  Header.h
//  CIPRES APP
//
//  Created by SDSC on 4/20/15.
//  Copyright (c) 2015 SDSC. All rights reserved.
//

#ifndef CIPRES_APP_Header_h
#define CIPRES_APP_Header_h

#import <UIKit/UIKit.h>

@interface APPMasterViewController : UITableViewController <NSXMLParserDelegate>{
    IBOutlet UILabel *label;
    NSString *USR;
    NSString *PWD;
    NSString *APPKEY;
    NSURL *URL;
}

@property (copy, nonatomic) NSString *usr;
@property (copy, nonatomic) NSString *pass;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITextView *textview;

@end
#endif

