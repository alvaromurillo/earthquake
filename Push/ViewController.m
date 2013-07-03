//
//  ViewController.m
//  Push
//
//  Created by Álvaro Murillo del Puerto on 02/07/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import "ViewController.h"
#import "Earthquake.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendPush:(id)sender {
	
	[self.sendButton setEnabled:NO];
	[self.spinner startAnimating];
	
	// Obtenemos los valores de los formularios
	NSString *name = self.nameTextField.text;
	NSNumber *magnitude = [NSNumber numberWithDouble:[self.magnitudeTextField.text doubleValue]];
	NSNumber *latitude = [NSNumber numberWithDouble:[self.latitudeTextField.text doubleValue]];
	NSNumber *longitude = [NSNumber numberWithDouble:[self.longitudeTextField.text doubleValue]];
	
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://go.urbanairship.com"]];
	[httpClient setParameterEncoding:AFJSONParameterEncoding];
	[httpClient setAuthorizationHeaderWithUsername:@"O65L9MmZQ4eP671roPaFXg" password:@"zW1MWZpFSjuIXkYsqCGCaw"];
	[httpClient setDefaultHeader:@"Accept" value:@"application/json"];
	[httpClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
															path:@"/api/push/broadcast/"
													  parameters:@{@"aps" : @{ @"alert" : name, @"sound" : @"cat.caf"}, @"title" : name, @"magnitude" : magnitude, @"latitude" : latitude, @"longitude" : longitude}];
	AFHTTPRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
		[self.sendButton setEnabled:YES];
		[self.spinner stopAnimating];
	} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
		[self.sendButton setEnabled:YES];
		[self.spinner stopAnimating];
	}];
	[operation start];
}

@end
