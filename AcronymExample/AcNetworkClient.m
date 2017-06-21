//
//  AcNetworkClient.m
//  AcronymExample
//
//  Created by Rajavardhan Soma on 8/17/16.
//  Copyright © 2016 Rajavardhan Soma. All rights reserved.
//

#import "AcNetworkClient.h"
#import "AcMeaning.h"

@implementation AcNetworkClient

+(AcNetworkClient *) sharedManager {
    
    static AcNetworkClient *sharedManager = nil;
    static dispatch_once_t once ;
    dispatch_once(&once, ^{
        sharedManager = [[AcNetworkClient alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    return self;
}

- (void)getResponseForURLString: (NSString *)urlString Parameters:(NSDictionary *) parameters success:(ServiceSuccessBlock) success failure:(ServiceFailureBlock) failure
{
    /*
     These are the accepted content types in AFURLResponseSerialization.
     @"application/json", @"text/json", @"text/javascript"
     
     But below api is sending "Content-Type" = "text/plain;
     http://www.nactem.ac.uk/software/acromine/dictionary.py
     */
    // Below line is to accept response of any type
    // Better solution is to ask the Server to send content type as "application/json"
    self.responseSerializer.acceptableContentTypes = nil;
    
    [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, [self parseResponseObject:responseObject]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

-(AcAcronym *) parseResponseObject:(id) responseObject {
    
    if([responseObject isKindOfClass:[NSArray class]] && [responseObject count] > 0 ){
        for(NSDictionary *dict in responseObject){
            
                       AcAcronym *acronym = [[AcAcronym alloc] init];
            [acronym setShortForm: [dict objectForKey:@"sf"]] ;
            [acronym setMeanings:[self getMeanings:[dict objectForKey:@"lfs"]]];
            return acronym;
        }
        
    }
    return nil;
}
-(NSMutableArray *) getMeanings:(NSMutableArray *) responseArray {
    NSMutableArray *meaningArray = [NSMutableArray array];
    for(NSDictionary *dict in responseArray){
        
        AcMeaning *meaning = [[AcMeaning alloc] init];
        [meaning setMeaning: [dict objectForKey:@"lf"]] ;
        [meaning setFrequency: [[dict objectForKey:@"freq"] integerValue]] ;
        [meaning setSince: [[dict objectForKey:@"since"] integerValue]] ;
        [meaning setVariations:[self getVariations:[dict objectForKey:@"vars"]]];
        [meaningArray addObject:meaning];
    }
    return meaningArray;
}

-(NSMutableArray *) getVariations:(NSMutableArray *) responseArray {
    NSMutableArray *variationsArray = [NSMutableArray array];
    for(NSDictionary *dict in responseArray){
        
        AcMeaning *meaning = [[AcMeaning alloc] init];
        [meaning setMeaning: [dict objectForKey:@"lf"]] ;
        [meaning setFrequency: [[dict objectForKey:@"freq"] integerValue]] ;
        [meaning setSince: [[dict objectForKey:@"since"] integerValue]] ;
        
        [variationsArray addObject:meaning];
    }
    return variationsArray;
}



@end
