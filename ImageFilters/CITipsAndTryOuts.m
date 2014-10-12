//
//  CITipsAndTryOuts.m
//  ImageFilters
//
//  Created by mar Jinn on 10/12/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CITipsAndTryOuts.h"
@import CoreGraphics;
@import ImageIO;

@implementation CITipsAndTryOuts
/*
 Core Image Classes
 ------------------
 
 CIFIlter 
 - mutable
 - represents an effect
 - has image/numeric input parameters
 - produces one output image based on current inputs
 
 CIImage
 - immutable
 - represents the "recipe" for an image ,not an actual image
     i.e, information necessary to draw an image
 - can represent a file from disk or the input of a CIFilter
 
 CIContext
 - an object through which Core Image draws results
 - Can be based on CPU or GPU
 
 */

id getSepiaToneAppliedImage (CGImageRef image)
{
    //cretae CIImage
    CIImage* ci_image = nil;
    ci_image = [CIImage imageWithCGImage:image];
    
    //create a CIFilter and set input values
    CIFilter* ci_sepiaFilter = nil;
    ci_sepiaFilter = [CIFilter filterWithName:@"CISepiaTone"];
    
    if (ci_sepiaFilter)
    {
        [ci_sepiaFilter setValue:ci_image forKey:kCIInputImageKey];
        [ci_sepiaFilter setValue:[NSNumber numberWithFloat:0.8f]
                          forKey:@"inputIntensity"];
    }
    
    //create a CIContext
    CIContext* ci_context = nil;
    ci_context = [CIContext contextWithOptions:nil];
    
    //render the filter output into a CGIImage
    CIImage* resultantImage = nil;
    resultantImage =
    /*
     [ci_sepiaFilter valueForKey:kCIOutputImageKey];
     Causes this exception because i used CGImage instead of CIImage while setting input image
     
     *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[__NSCFType extent]: unrecognized selector sent to instance 0x7fd520d81450'
     *** First throw call stack:
     (
     0   CoreFoundation                      0x000000010b0ba3f5 __exceptionPreprocess + 165
     1   libobjc.A.dylib                     0x000000010ad53bb7 objc_exception_throw + 45
     2   CoreFoundation                      0x000000010b0c150d -[NSObject(NSObject) doesNotRecognizeSelector:] + 205
     3   CoreFoundation                      0x000000010b0197fc ___forwarding___ + 988
     4   CoreFoundation                      0x000000010b0bb938 __forwarding_prep_1___ + 120
     5   CoreImage                           0x000000010b719ab5 -[CISepiaTone outputImage] + 137
     6   Foundation                          0x000000010a8da543 -[NSObject(NSKeyValueCoding) valueForKey:] + 251
     7   ImageFilters                        0x000000010a8267b2 getSepiaToneAppliedImage + 386
     8   ImageFilters                        0x000000010a826293 -[ViewController viewDidLoad] + 179
     9   UIKit                               0x000000010ba8b190 -[UIViewController loadViewIfRequired] + 738
     10  UIKit                               0x000000010ba8b38e -[UIViewController view] + 27
     11  UIKit                               0x000000010b9aadb9 -[UIWindow addRootViewControllerViewIfPossible] + 58
     12  UIKit                               0x000000010b9ab152 -[UIWindow _setHidden:forced:] + 276
     13  UIKit                               0x000000010b9b765c -[UIWindow makeKeyAndVisible] + 42
     14  UIKit                               0x000000010b962191 -[UIApplication _callInitializationDelegatesForMainScene:transitionContext:] + 2628
     15  UIKit                               0x000000010b964e5c -[UIApplication _runWithMainScene:transitionContext:completion:] + 1350
     16  UIKit                               0x000000010b963d22 -[UIApplication workspaceDidEndTransaction:] + 179
     17  FrontBoardServices                  0x00000001117fc2a3 __31-[FBSSerialQueue performAsync:]_block_invoke + 16
     18  CoreFoundation                      0x000000010afefabc __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 12
     19  CoreFoundation                      0x000000010afe5805 __CFRunLoopDoBlocks + 341
     20  CoreFoundation                      0x000000010afe55c5 __CFRunLoopRun + 2389
     21  CoreFoundation                      0x000000010afe4a06 CFRunLoopRunSpecific + 470
     22  UIKit                               0x000000010b963799 -[UIApplication _run] + 413
     23  UIKit                               0x000000010b966550 UIApplicationMain + 1282
     24  ImageFilters                        0x000000010a8269a8 main + 120
     25  libdyld.dylib                       0x000000010daf2145 start + 1
     26  ???                                 0x0000000000000001 0x0 + 1
     )
     libc++abi.dylib: terminating with uncaught exception of type NSException
     
     */
    
    //[ci_sepiaFilter valueForKey:[[ci_sepiaFilter outputKeys]firstObject]];
    [ci_sepiaFilter outputImage];
    
    CGColorSpaceRef deviceColorSpace = NULL;
    deviceColorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGImageRef cgImage = NULL;
    cgImage =
    [ci_context  createCGImage:resultantImage
                      fromRect:(CGRect)[resultantImage extent]
                        format:(CIFormat)kCIFormatRGBA8
                    colorSpace:deviceColorSpace];
    
    CGColorSpaceRelease(deviceColorSpace);
    
    return CFBridgingRelease(cgImage);
    
}

CIContext* getContext (void)
{
    static CIContext* sharedContext = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        EAGLContext *myEAGLContext = nil;
        myEAGLContext =
        [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        
        NSDictionary* options = nil;
        options =
        @{kCIContextWorkingColorSpace : [NSNull null]};
        
        CIContext* context = nil;
        context =
        [CIContext contextWithEAGLContext:myEAGLContext options:options];
        
        sharedContext = context;
    });
    
    return (CIContext*)sharedContext;
}

id CreateFilterAppliedImage
(NSString* filterName , NSDictionary* inputParametersDict)
{
//    //create CIImage
//    CIImage* ciInputImage = nil;
//    ciInputImage =
//    [CIImage imageWithCGImage:
//     (__bridge CGImageRef)(inputParametersDict[kCIInputImageKey])
//                      options:nil];
    
    
    //create the filter
    CIFilter* filter = nil;
    filter = [CIFilter filterWithName:filterName];
    
    [inputParametersDict
     enumerateKeysAndObjectsUsingBlock:
     ^(id key, id obj, BOOL *stop)
    {
        [filter setValue:obj forKey:(NSString *)key];
    }];
    
    CIImage* resultantImage = nil;
    resultantImage =
    [filter outputImage];

    CIContext* context = nil;
    context = getContext();
    
    CGColorSpaceRef deviceColorSpace = NULL;
    deviceColorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGImageRef cgImage = NULL;
    cgImage =
    [context  createCGImage:resultantImage
                      fromRect:(CGRect)[resultantImage extent]
                        format:(CIFormat)kCIFormatRGBA8
                    colorSpace:deviceColorSpace];
    
    CGColorSpaceRelease(deviceColorSpace);
    
     return CFBridgingRelease(cgImage);
}


id CreateMultipleFilterAppliedImage
(NSOrderedSet * filterName , NSDictionary* inputParametersDict)
{
        //create CIImage
//        __block CIImage* ciInputImage = nil;
//        ciInputImage =
//        [CIImage imageWithCGImage:
//         (__bridge CGImageRef)
//         (inputParametersDict[filterName[0]][kCIInputImageKey])
//                          options:nil];
    
    
    //create the filter
    __block CIFilter* filter = nil;
    
    //output Image
    __block CIImage* resultantImage = nil;

    [filterName enumerateObjectsUsingBlock:
     ^(id obj, NSUInteger idx, BOOL *stop)
    {
    
        filter = [CIFilter filterWithName:
                  [(NSString*)obj stringByTrimmingCharactersInSet:
                   [NSCharacterSet characterSetWithCharactersInString:@"_1234567890"]]];
        
//        [inputParametersDict 
//         enumerateKeysAndObjectsUsingBlock:
//         ^(id key, id obj, BOOL *stop)
//         {
//             if ([(NSString*)key isEqualToString:kCIInputImageKey] && idx == 0)
//             {
//                 [filter setValue:ciInputImage forKey:(NSString *)key];
//             }
//             else
//             {
//                 [filter setValue:obj forKey:(NSString *)key];
//             }
             
//             if (idx == 1)
//             {
//                 resultantImage =
//                 [filter outputImage];
//                 
//                 ciInputImage = nil;
//                 ciInputImage = resultantImage;
        
        NSMutableDictionary* mutableParameterDict = nil;
        mutableParameterDict = [inputParametersDict mutableCopy];
        
             if (idx == 0)
             {
             resultantImage = setAllFilterParameters(mutableParameterDict[(NSString*)obj], filter);
             }
             if (idx > 0)
             {
                 [mutableParameterDict removeObjectForKey:(id)obj];
                 
                 [mutableParameterDict setObject:(id)
                   [[inputParametersDict valueForKey:(NSString *)obj] mutableCopy]
                                          forKey:(id<NSCopying>)obj] ;
                 
                 [[mutableParameterDict valueForKey:(NSString *)obj]
                  setObject:(id)resultantImage
                  forKey:(id<NSCopying>)kCIInputImageKey];
                 
                 resultantImage = nil;
                 resultantImage = setAllFilterParameters(mutableParameterDict[(NSString*)obj], filter);
             }
             

             
//         }];
        
       
        
        
      

    }];//filter enum
    
    
    CIContext* context = nil;
    context = getContext();
    
    CGColorSpaceRef deviceColorSpace = NULL;
    deviceColorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGImageRef cgImage = NULL;
    cgImage =
    [context  createCGImage:resultantImage
                   fromRect:(CGRect)[resultantImage extent]
                     format:(CIFormat)kCIFormatRGBA8
                 colorSpace:deviceColorSpace];
    
    CGColorSpaceRelease(deviceColorSpace);
    
    return CFBridgingRelease(cgImage);
}

CIImage* setAllFilterParameters(NSDictionary* inputParametersDict, CIFilter* filter)
{
    [inputParametersDict
     enumerateKeysAndObjectsUsingBlock:
     ^(id key, id obj, BOOL *stop)
     {
         [filter setValue:obj forKey:(NSString *)key];
     }];
    
    CIImage* output = NULL;
    output =
    [filter outputImage];
    
    return output;
}


@end
