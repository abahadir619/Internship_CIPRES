//
//  ENTMasterViewController.h
//  CIPRES APP
//
//  Created by SDSC on 4/20/15.
//  Copyright (c) 2015 SDSC. All rights reserved.
//

#ifndef CIPRES_APP_ENTMasterViewController_h
#define CIPRES_APP_ENTMasterViewController_h

#import <UIKit/UIKit.h>

@interface ENTMasterViewController : UITableViewController <NSXMLParserDelegate>

@property (copy, nonatomic) NSString * element;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;

@end
#endif
