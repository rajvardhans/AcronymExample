//
//  AcMeaning.h
//  AcronymExample
//
//  Created by Rajavardhan Soma on 8/17/16.
//  Copyright © 2016 Rajavardhan Soma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcMeaning : NSObject

@property (nonatomic, copy) NSString *meaning;
@property NSInteger frequency;
@property NSInteger since;
@property (nonatomic, copy) NSMutableArray *variations;

@end
