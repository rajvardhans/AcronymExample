//
//  AcConstants.h
//  AcronymExample
//
//  Created by Rajavardhan Soma on 8/17/16.
//  Copyright © 2016 Rajavardhan Soma. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const AcBaseURL;
extern NSString *const kAppFontName;
extern NSString *const kAppBoldFontName;

#define labelTextFont [UIFont fontWithName:kAppFontName size:15.0f]
#define labelBoldTextFont [UIFont fontWithName:kAppBoldFontName size:15.0f]
#define descriptionTextFont [UIFont fontWithName:kAppFontName size:13.0f]
#define cellVerticalPadding 10
#define cellHorizontalWaste 50
#define MAXLENGTH 30

@interface AcConstants : NSObject

@end
