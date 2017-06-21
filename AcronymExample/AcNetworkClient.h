//
//  AcNetworkClient.h
//  AcronymExample
//
//  Created by Rajavardhan Soma on 8/17/16.
//  Copyright © 2016 Rajavardhan Soma. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"
#import "AcAcronym.h"

typedef void (^ServiceSuccessBlock)(NSURLSessionDataTask *task, AcAcronym *acronym);
typedef void (^ServiceFailureBlock)(NSURLSessionDataTask *task, NSError *error);


@interface AcNetworkClient : AFHTTPSessionManager

/*
 * @discussion
 * @return SingleTon instance of AINetworkClient
 */
+(AcNetworkClient *) sharedManager;

/*
 * @discussion - This method makes a GET request to the given URL.
 * @param urlString url string of webservice
 * @parameters Dictionary of parameters to be sent
 * @success Successblock to be called on service success
 * @failure FailureBlock to be called on service failure
 *
 *  *** Sample usage ***
 * GET webservice : http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=usa
 * urlstring : http://www.nactem.ac.uk/software/acromine/dictionary.py?
 * parameters: @{@"sf": @"usa"}
 *
 */
- (void)getResponseForURLString: (NSString *)urlString Parameters:(NSDictionary *) parameters success:(ServiceSuccessBlock) success failure:(ServiceFailureBlock) failure;


@end
