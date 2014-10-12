//
//  ViewController.m
//  ImageFilters
//
//  Created by mar Jinn on 10/11/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "ViewController.h"
#import "CITipsAndTryOuts.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*Displaying an image in UIIMageView */
    UIImageView* imgView = nil;
    imgView =
    [[UIImageView alloc] initWithFrame:[[self view] bounds]];
    
    [[self view] addSubview:imgView];
    
    //input Image
    UIImage* image = nil;
    image = [UIImage imageNamed:@"arrow.jpg"];
    
    CGImageRef cg_image = NULL;
    cg_image = [image CGImage];
    
    //create CIImage
    CIImage* ci_image = nil;
    ci_image = [CIImage imageWithCGImage:cg_image];
    
    //create a CIFilter and set input values
    CIFilter* ci_sepiaFilter = nil;
    ci_sepiaFilter = [CIFilter filterWithName:@"CISepiaTone"];
    
    [ci_sepiaFilter setValue:ci_image forKey:kCIInputImageKey];
    [ci_sepiaFilter setValue:[NSNumber numberWithFloat:0.8f]
                      forKey:@"inputIntensity"];
    

    //create context
    CIContext* context = nil;

    
    
}

-(void) applyAnImageToTheViewsLayer
{
    UIImage* image = nil;
    image = [UIImage imageNamed:@"arrow.jpg"];
    
    CGImageRef cgImage  = NULL;
    cgImage = [image CGImage];
    
    CGImageRef sepiaImage = NULL;
    sepiaImage =
    //    //(__bridge CGImageRef)(getSepiaToneAppliedImage(cgImage));
    //
    //    (__bridge CGImageRef)(CreateFilterAppliedImage
    //    (
    //     @"CISepiaTone",
    //     @{
    //
    //       @"inputImage" : [CIImage imageWithCGImage:cgImage
    //                                         ] ,
    //       @"inputIntensity" : [NSNumber numberWithFloat:0.8f]
    //    }
    //     ));
    
    
    //OR Do this
    
    
    //    [[CIContext contextWithOptions:nil]
    //     createCGImage:
    //    (CIImage*)
    //     [
    //      (CIFilter*)
    //      [CIFilter filterWithName:@"CISepiaTone"
    //                 keysAndValues:
    //     kCIInputImageKey, [CIImage imageWithCGImage:cgImage],
    //     @"inputIntensity" , [NSNumber numberWithFloat:0.8f]
    //     , nil]
    //      outputImage]
    //     fromRect:CGRectMake(0.0f, 0.0f, [image size].width, [image size].height)];
    
    
    
    (__bridge CGImageRef)(CreateMultipleFilterAppliedImage
                          (
                           [[NSOrderedSet alloc] initWithArray:@[@"CISepiaTone",@"CIHueAdjust",@"CISepiaTone_1"]]
                           ,
                           @{
                             @"CISepiaTone" : @{
                                     
                                     @"inputImage" : [CIImage imageWithCGImage:cgImage
                                                      ] ,
                                     @"inputIntensity" : [NSNumber numberWithFloat:0.0f]
                                     }
                             ,
                             
                             @"CIHueAdjust" : @{
                                     
                                     @"inputImage" : [NSNull null] ,
                                     @"inputAngle" : [NSNumber numberWithFloat:0.8f]
                                     
                                     }
                             ,
                             
                             @"CISepiaTone_1" : @{
                                     
                                     @"inputImage" : [NSNull null]
                                     ,
                                     @"inputIntensity" : [NSNumber numberWithFloat:0.8f]
                                     }
                             
                             
                             }
                           ));
    
    
    //[[[self view] layer] setContents:(__bridge id)cgImage];
    
    [[[self view] layer] setContents:(__bridge id)sepiaImage];
    
    //as it is being retained by the layer
    CGImageRelease(sepiaImage);
    
    sepiaImage = NULL;
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
