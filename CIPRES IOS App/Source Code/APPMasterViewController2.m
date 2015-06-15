//
//  APPMasterViewController.m
//  CIPRES APP
//
//  Created by SDSC on 4/20/15.
//  Copyright (c) 2015 SDSC. All rights reserved.
//

#import <Foundation/Foundation.h>
//
//  APPMasterViewController.m
//  RSSreader
//
//  Created by Rafael Garcia Leiva on 08/04/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "APPMasterViewController2.h"
#import "APPDetailViewController2.h"
#import "ViewController.h"


@interface APPMasterViewController () {
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
}
@end


@implementation APPMasterViewController

@synthesize tableView;
@synthesize textview;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    feeds = [[NSMutableArray alloc] init];
    /*NSURL *url = [NSURL URLWithString:@"http://images.apple.com/main/rss/hotnews/hotnews.rss"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];*/
    
    // Performt the HTTP Get Request to list all jobs
    NSLog(@"You have listed your jobs!!");
   // USR = @"abl012";
   // PWD = @"hello1";
    USR = self.usr;
    PWD = self.pass;
    //self.usr = @"abl012";
    //self.pass = @"hello1";
    NSLog(@"The USER PASSED IN is: ");
    NSLog(self.usr);
    NSLog(@"The PASSWD PASSED IN is: ");
    NSLog(self.pass);
    
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
    feeds = [[NSMutableArray alloc] init];
    NSURL *url2 = [NSURL URLWithString:@"http://images.apple.com/main/rss/hotnews/hotnews.rss"];
    //parser = [[NSXMLParser alloc] initWithContentsOfURL:url2];
    parser = [[NSXMLParser alloc]initWithData:urlData];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey: @"url"];
    return cell;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"selfUri"]) {
        NSLog(@"Found selfUri!\n");
        item    = [[NSMutableDictionary alloc] init];
        link    = [[NSMutableString alloc] init];
        title   = [[NSMutableString alloc] init];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"selfUri"]) {
        
        [item setObject:link forKey:@"url"];
        [item setObject:title forKey:@"title"];
        [feeds addObject:[item copy]];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
        [link appendString:string];
    } else if ([element isEqualToString:@"url"]) {
       // [link appendString:string];
    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *string = [feeds[indexPath.row] objectForKey: @"title"];
        [[segue destinationViewController] setUrl:string];
        [[segue destinationViewController] setUsr:USR];
        [[segue destinationViewController] setPass:PWD];
        
        NSLog(@"Segue source view controller: %@", [segue sourceViewController] );
        NSLog(@"Segue dest view controller: %@", [segue destinationViewController] );
    
    }
}


@end