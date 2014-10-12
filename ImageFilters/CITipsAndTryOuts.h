//
//  CITipsAndTryOuts.h
//  ImageFilters
//
//  Created by mar Jinn on 10/12/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreImage;

@interface CITipsAndTryOuts : NSObject

id getSepiaToneAppliedImage (CGImageRef image);

id CreateFilterAppliedImage
(NSString* filterName , NSDictionary* inputParametersDict);

id CreateMultipleFilterAppliedImage
(NSOrderedSet * filterName , NSDictionary* inputParametersDict);

@end
