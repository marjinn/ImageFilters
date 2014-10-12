//
//  CoreImageRecipes.m
//  ImageFilters
//
//  Created by mar Jinn on 10/11/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CoreImageRecipes.h"
@import CoreImage;
@import CoreGraphics;
@import ImageIO;

@implementation CoreImageRecipes

void functionCall (void)
{
    getListOfAvailableFIlters();
}


void getListOfAvailableFIlters (void)
{
    NSArray* listOfFilterCAtegories = nil;
    listOfFilterCAtegories =
     @[
       kCICategoryDistortionEffect,
       kCICategoryGeometryAdjustment,
       kCICategoryCompositeOperation,
       kCICategoryHalftoneEffect,
       kCICategoryColorAdjustment,
       kCICategoryColorEffect,
       kCICategoryTransition,
       kCICategoryTileEffect,
       kCICategoryGenerator,
       kCICategoryReduction,
       kCICategoryGradient,
       kCICategoryStylize,
       kCICategorySharpen,
       kCICategoryBlur,
       kCICategoryVideo,
       kCICategoryStillImage,
       kCICategoryInterlaced,
       kCICategoryNonSquarePixels,
       kCICategoryHighDynamicRange,
       kCICategoryBuiltIn
       ];
    
    NSMutableDictionary* listOfFliters = nil;
    listOfFliters =
    [NSMutableDictionary dictionaryWithCapacity:(NSUInteger)[listOfFilterCAtegories count]];
    
    NSEnumerator* objectEnumerator = nil;
    objectEnumerator = [listOfFilterCAtegories objectEnumerator];
    
    id <NSCopying> filterCategory = nil;
    
    //enumerate through list of all categories
    while ( (filterCategory = [objectEnumerator nextObject]) )
    {
        //array of filter names
        NSArray* arrayOfFilterNames = nil;
        arrayOfFilterNames =
        (NSArray*)[CIFilter filterNamesInCategory:(NSString *)filterCategory];
        
        NSMutableArray* filterAttributesArray = nil;
        filterAttributesArray = [NSMutableArray arrayWithCapacity:[arrayOfFilterNames count]];
        
        //for each filter get its inputkeys , outputkeys and attributes
        //add to a array filterAttributesArray
        for(NSString* filterName in arrayOfFilterNames)
        {
            //get the filter
            CIFilter* filter = nil;
            filter = [CIFilter filterWithName:(NSString *)filterName];
            
            //create an array that contains a dictionary
            //dictionary - key -> filter name
            //dictionary valeu -> another dictionary
            //another dictionary -> key& values
            /*
             @"filter inputKeys" : [filter inputKeys],
             @"filter outputKeys" : [filter outputKeys],
             @"filter attributes" : [filter attributes]

             */
            
            
            [filterAttributesArray addObject:(id)
            @
            { filterName :
                @
                {
                    @"filter inputKeys" : [filter inputKeys],
                    @"filter outputKeys" : [filter outputKeys],
                    @"filter attributes" : [filter attributes]
                }
            }
            ];
            
             
        }//for
    
        
        listOfFliters[filterCategory] = filterAttributesArray;

        
    }//while

 
    /* OUTPUT
     
     (lldb) po listOfFliters
     {
     CICategoryBlur =     (
     {
     CIGaussianBlur =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryBlur,
     CICategoryStillImage,
     CICategoryVideo,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gaussian Blur";
     CIAttributeFilterName = CIGaussianBlur;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryBuiltIn =     (
     {
     CIAccordionFoldTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Accordion Fold Transition";
     CIAttributeFilterName = CIAccordionFoldTransition;
     inputBottomHeight =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputFoldShadowAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.1";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNumberOfFolds =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 3;
     CIAttributeMax = 50;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputBottomHeight,
     inputNumberOfFolds,
     inputFoldShadowAmount,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAdditionCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Addition;
     CIAttributeFilterName = CIAdditionCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Clamp";
     CIAttributeFilterName = CIAffineClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Tile";
     CIAttributeFilterName = CIAffineTile;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Transform";
     CIAttributeFilterName = CIAffineTransform;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeType = CIAttributeTypeTransform;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAreaHistogram =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryReduction,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Area Histogram";
     CIAttributeFilterName = CIAreaHistogram;
     inputCount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 64;
     CIAttributeMax = 256;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 256;
     CIAttributeSliderMin = 10;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputExtent,
     inputScale,
     inputCount
     );
     "filter outputKeys" =                 (
     outputImage,
     outputData
     );
     };
     },
     {
     CIAztecCodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Aztec Code Generator";
     CIAttributeFilterName = CIAztecCodeGenerator;
     inputCompactStyle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     };
     inputCorrectionLevel =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 23;
     CIAttributeMax = 95;
     CIAttributeMin = 5;
     CIAttributeSliderMax = 95;
     CIAttributeSliderMin = 5;
     };
     inputLayers =                     {
     CIAttributeClass = NSNumber;
     CIAttributeMax = 32;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 32;
     CIAttributeSliderMin = 1;
     };
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputCorrectionLevel,
     inputLayers,
     inputCompactStyle
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIBarsSwipeTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bars Swipe Transition";
     CIAttributeFilterName = CIBarsSwipeTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "3.141592653589793";
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputBarOffset =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 30;
     CIAttributeMin = 2;
     CIAttributeSliderMax = 300;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputAngle,
     inputWidth,
     inputBarOffset,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBlendWithAlphaMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Blend With Alpha Mask";
     CIAttributeFilterName = CIBlendWithAlphaMask;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage,
     inputMaskImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBlendWithMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Blend With Mask";
     CIAttributeFilterName = CIBlendWithMask;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage,
     inputMaskImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBloom =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Bloom;
     CIAttributeFilterName = CIBloom;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBumpDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bump Distortion";
     CIAttributeFilterName = CIBumpDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 600;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBumpDistortionLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bump Distortion Linear";
     CIAttributeFilterName = CIBumpDistortionLinear;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 600;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICheckerboardGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Checkerboard;
     CIAttributeFilterName = CICheckerboardGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 80;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICircleSplashDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Circle Splash Distortion";
     CIAttributeFilterName = CICircleSplashDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICircularScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Circular Screen";
     CIAttributeFilterName = CICircularScreen;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICode128BarcodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Code128 Barcode Generator";
     CIAttributeFilterName = CICode128BarcodeGenerator;
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     inputQuietSpace =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 7;
     CIAttributeMax = 20;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 20;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputQuietSpace
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIColorBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Blend Mode";
     CIAttributeFilterName = CIColorBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Burn Blend Mode";
     CIAttributeFilterName = CIColorBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Clamp";
     CIAttributeFilterName = CIColorClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1 1 1]";
     };
     inputMinComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputMinComponents,
     inputMaxComponents
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorControls =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Controls";
     CIAttributeFilterName = CIColorControls;
     inputBrightness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSaturation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSaturation,
     inputBrightness,
     inputContrast
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCrossPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cross Polynomial";
     CIAttributeFilterName = CIColorCrossPolynomial;
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 1 0 0 0 0 0 0 0]";
     };
     inputCoefficients =                     {
     CIAttributeClass = CIVector;
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 1 0 0 0 0 0 0 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCoefficients,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCube =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube";
     CIAttributeFilterName = CIColorCube;
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCubeWithColorSpace =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube with ColorSpace";
     CIAttributeFilterName = CIColorCubeWithColorSpace;
     inputColorSpace =                     {
     CIAttributeClass = NSObject;
     };
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData,
     inputColorSpace
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Dodge Blend Mode";
     CIAttributeFilterName = CIColorDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorInvert =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Invert";
     CIAttributeFilterName = CIColorInvert;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMap =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Map";
     CIAttributeFilterName = CIColorMap;
     inputGradientImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputGradientImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMatrix =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Matrix";
     CIAttributeFilterName = CIColorMatrix;
     inputAVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 1]";
     CIAttributeIdentity = "[0 0 0 1]";
     };
     inputBVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0]";
     CIAttributeIdentity = "[0 0 1 0]";
     };
     inputBiasVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0]";
     };
     inputGVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRVector,
     inputGVector,
     inputBVector,
     inputAVector,
     inputBiasVector
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMonochrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Monochrome";
     CIAttributeFilterName = CIColorMonochrome;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 0.45 0.3 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Polynomial";
     CIAttributeFilterName = CIColorPolynomial;
     inputAlphaCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients,
     inputAlphaCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPosterize =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Posterize";
     CIAttributeFilterName = CIColorPosterize;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLevels =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeIdentity = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 30;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputLevels
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConstantColorGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Constant Color";
     CIAttributeFilterName = CIConstantColorGenerator;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     };
     "filter inputKeys" =                 (
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution3X3 =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "3X3 Convolution";
     CIAttributeFilterName = CIConvolution3X3;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution5X5 =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "5X5 Convolution";
     CIAttributeFilterName = CIConvolution5X5;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution9Horizontal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Horizontal 9 Convolution";
     CIAttributeFilterName = CIConvolution9Horizontal;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution9Vertical =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vertical 9 Convolution";
     CIAttributeFilterName = CIConvolution9Vertical;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICopyMachineTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Copy Machine";
     CIAttributeFilterName = CICopyMachineTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 1 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.3";
     CIAttributeIdentity = "1.3";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 3;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 200;
     CIAttributeIdentity = 200;
     CIAttributeMin = "0.1";
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = "0.1";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputExtent,
     inputColor,
     inputTime,
     inputAngle,
     inputWidth,
     inputOpacity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICrop =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Crop;
     CIAttributeFilterName = CICrop;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRectangle =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]";
     CIAttributeIdentity = "[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRectangle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDarkenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Darken Blend Mode";
     CIAttributeFilterName = CIDarkenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDifferenceBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Difference Blend Mode";
     CIAttributeFilterName = CIDifferenceBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDisintegrateWithMaskTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Disintegrate With Mask";
     CIAttributeFilterName = CIDisintegrateWithMaskTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputShadowDensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.65";
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowOffset =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 -10]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputShadowRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 8;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputMaskImage,
     inputTime,
     inputShadowRadius,
     inputShadowDensity,
     inputShadowOffset
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDissolveTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Dissolve;
     CIAttributeFilterName = CIDissolveTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDivideBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Divide Blend Mode";
     CIAttributeFilterName = CIDivideBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDotScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Dot Screen";
     CIAttributeFilterName = CIDotScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIEightfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Eightfold Reflected Tile";
     CIAttributeFilterName = CIEightfoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExclusionBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Exclusion Blend Mode";
     CIAttributeFilterName = CIExclusionBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExposureAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Exposure Adjust";
     CIAttributeFilterName = CIExposureAdjust;
     inputEV =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "-10";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputEV
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFalseColor =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "False Color";
     CIAttributeFilterName = CIFalseColor;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.3 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.9 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFlashTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Flash;
     CIAttributeFilterName = CIFlashTransition;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.8 0.6 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputFadeThreshold =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.85";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxStriationRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.58";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputStriationContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.375";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 5;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputStriationStrength =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 3;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputCenter,
     inputExtent,
     inputColor,
     inputTime,
     inputMaxStriationRadius,
     inputStriationStrength,
     inputStriationContrast,
     inputFadeThreshold
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Reflected Tile";
     CIAttributeFilterName = CIFourfoldReflectedTile;
     inputAcuteAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.570796326794897";
     CIAttributeIdentity = "1.570796326794897";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputAcuteAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldRotatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Rotated Tile";
     CIAttributeFilterName = CIFourfoldRotatedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldTranslatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Translated Tile";
     CIAttributeFilterName = CIFourfoldTranslatedTile;
     inputAcuteAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.570796326794897";
     CIAttributeIdentity = "1.570796326794897";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputAcuteAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGammaAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gamma Adjust";
     CIAttributeFilterName = CIGammaAdjust;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPower =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = "0.25";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPower
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGaussianBlur =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryBlur,
     CICategoryStillImage,
     CICategoryVideo,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gaussian Blur";
     CIAttributeFilterName = CIGaussianBlur;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGaussianGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gaussian Gradient";
     CIAttributeFilterName = CIGaussianGradient;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 0)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGlassDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Glass Distortion";
     CIAttributeFilterName = CIGlassDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 200;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = "0.01";
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTexture =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTexture,
     inputCenter,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGlideReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Glide Reflected Tile";
     CIAttributeFilterName = CIGlideReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGloom =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Gloom;
     CIAttributeFilterName = CIGloom;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHardLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hard Light Blend Mode";
     CIAttributeFilterName = CIHardLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHatchedScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hatched Screen";
     CIAttributeFilterName = CIHatchedScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHighlightShadowAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Highlights and Shadows";
     CIAttributeFilterName = CIHighlightShadowAdjust;
     inputHighlightAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "0.3";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputShadowAmount,
     inputHighlightAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHistogramDisplayFilter =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryReduction,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Histogram Display";
     CIAttributeFilterName = CIHistogramDisplayFilter;
     inputHeight =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 200;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputHighLimit =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLowLimit =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputHeight,
     inputHighLimit,
     inputLowLimit
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHoleDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hole Distortion";
     CIAttributeFilterName = CIHoleDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeIdentity = "0.1";
     CIAttributeMin = "0.01";
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = "0.01";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Adjust";
     CIAttributeFilterName = CIHueAdjust;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Blend Mode";
     CIAttributeFilterName = CIHueBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILanczosScaleTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lanczos Scale Transform";
     CIAttributeFilterName = CILanczosScaleTransform;
     inputAspectRatio =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "2.5";
     CIAttributeSliderMin = "0.05";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "1.5";
     CIAttributeSliderMin = "0.05";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputScale,
     inputAspectRatio
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lighten Blend Mode";
     CIAttributeFilterName = CILightenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightTunnel =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Light Tunnel";
     CIAttributeFilterName = CILightTunnel;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputRotation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "1.570796326794897";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRotation,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Burn Blend Mode";
     CIAttributeFilterName = CILinearBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Dodge Blend Mode";
     CIAttributeFilterName = CILinearDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Gradient";
     CIAttributeFilterName = CILinearGradient;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[200 200]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputPoint0,
     inputPoint1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearToSRGBToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear to sRGB Tone Curve";
     CIAttributeFilterName = CILinearToSRGBToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILineScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Line Screen";
     CIAttributeFilterName = CILineScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILuminosityBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Luminosity Blend Mode";
     CIAttributeFilterName = CILuminosityBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaskToAlpha =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Mask to Alpha";
     CIAttributeFilterName = CIMaskToAlpha;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Maximum Component";
     CIAttributeFilterName = CIMaximumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Maximum;
     CIAttributeFilterName = CIMaximumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Minimum Component";
     CIAttributeFilterName = CIMinimumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Minimum;
     CIAttributeFilterName = CIMinimumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIModTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Mod;
     CIAttributeFilterName = CIModTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = "-6.283185307179586";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputCompression =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 100;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputCenter,
     inputTime,
     inputAngle,
     inputRadius,
     inputCompression
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Multiply Blend Mode";
     CIAttributeFilterName = CIMultiplyBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Multiply;
     CIAttributeFilterName = CIMultiplyCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIOverlayBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Overlay Blend Mode";
     CIAttributeFilterName = CIOverlayBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveCorrection =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Perspective Correction";
     CIAttributeFilterName = CIPerspectiveCorrection;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectChrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Chrome";
     CIAttributeFilterName = CIPhotoEffectChrome;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectFade =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Fade";
     CIAttributeFilterName = CIPhotoEffectFade;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectInstant =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Instant";
     CIAttributeFilterName = CIPhotoEffectInstant;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectMono =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Mono";
     CIAttributeFilterName = CIPhotoEffectMono;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectNoir =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Noir";
     CIAttributeFilterName = CIPhotoEffectNoir;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectProcess =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Process";
     CIAttributeFilterName = CIPhotoEffectProcess;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTonal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Tonal";
     CIAttributeFilterName = CIPhotoEffectTonal;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTransfer =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Transfer";
     CIAttributeFilterName = CIPhotoEffectTransfer;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinchDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pinch Distortion";
     CIAttributeFilterName = CIPinchDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pin Light Mode";
     CIAttributeFilterName = CIPinLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPixellate =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Pixelate;
     CIAttributeFilterName = CIPixellate;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 8;
     CIAttributeIdentity = 1;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIQRCodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "QRCode Generator";
     CIAttributeFilterName = CIQRCodeGenerator;
     inputCorrectionLevel =                     {
     CIAttributeClass = NSString;
     CIAttributeDefault = M;
     };
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputCorrectionLevel
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIRadialGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Radial Gradient";
     CIAttributeFilterName = CIRadialGradient;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputRadius0 =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 5;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputRadius1 =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputRadius0,
     inputRadius1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIRandomGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Random Generator";
     CIAttributeFilterName = CIRandomGenerator;
     };
     "filter inputKeys" =                 (
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISaturationBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Saturation Blend Mode";
     CIAttributeFilterName = CISaturationBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIScreenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Screen Blend Mode";
     CIAttributeFilterName = CIScreenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISepiaTone =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Sepia Tone";
     CIAttributeFilterName = CISepiaTone;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISharpenLuminance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategorySharpen,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sharpen Luminance";
     CIAttributeFilterName = CISharpenLuminance;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.4";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISixfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sixfold Reflected Tile";
     CIAttributeFilterName = CISixfoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISixfoldRotatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sixfold Rotated Tile";
     CIAttributeFilterName = CISixfoldRotatedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISmoothLinearGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Smooth Linear Gradient";
     CIAttributeFilterName = CISmoothLinearGradient;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[200 200]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputPoint0,
     inputPoint1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISoftLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Soft Light Blend Mode";
     CIAttributeFilterName = CISoftLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceAtopCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Atop";
     CIAttributeFilterName = CISourceAtopCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceInCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source In";
     CIAttributeFilterName = CISourceInCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOutCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Out";
     CIAttributeFilterName = CISourceOutCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOverCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Over";
     CIAttributeFilterName = CISourceOverCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISRGBToneCurveToLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "sRGB Tone Curve to Linear";
     CIAttributeFilterName = CISRGBToneCurveToLinear;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStarShineGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Star Shine";
     CIAttributeFilterName = CIStarShineGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.8 0.6 1)";
     };
     inputCrossAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.6";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCrossOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "-2";
     CIAttributeMin = "-8";
     CIAttributeSliderMax = 0;
     CIAttributeSliderMin = "-8";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputCrossScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 15;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputCrossWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.5";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "0.5";
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputEpsilon =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "-2";
     CIAttributeMin = "-8";
     CIAttributeSliderMax = 0;
     CIAttributeSliderMin = "-8";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 50;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 300;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor,
     inputRadius,
     inputCrossScale,
     inputCrossAngle,
     inputCrossOpacity,
     inputCrossWidth,
     inputEpsilon
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStraightenFilter =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Straighten;
     CIAttributeFilterName = CIStraightenFilter;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStripesGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Stripes;
     CIAttributeFilterName = CIStripesGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 80;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISubtractBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Subtract Blend Mode";
     CIAttributeFilterName = CISubtractBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISwipeTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Swipe;
     CIAttributeFilterName = CISwipeTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = "0.1";
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = "0.1";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputExtent,
     inputColor,
     inputTime,
     inputAngle,
     inputWidth,
     inputOpacity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITemperatureAndTint =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Temperature and Tint";
     CIAttributeFilterName = CITemperatureAndTint;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputTargetNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputNeutral,
     inputTargetNeutral
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Tone Curve";
     CIAttributeFilterName = CIToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.25 0.25]";
     CIAttributeIdentity = "[0.25 0.25]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint2 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.5 0.5]";
     CIAttributeIdentity = "[0.5 0.5]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint3 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.75 0.75]";
     CIAttributeIdentity = "[0.75 0.75]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint4 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1]";
     CIAttributeIdentity = "[1 1]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint0,
     inputPoint1,
     inputPoint2,
     inputPoint3,
     inputPoint4
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITriangleKaleidoscope =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Triangle Kaleidoscope";
     CIAttributeFilterName = CITriangleKaleidoscope;
     inputDecay =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.85";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputRotation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "5.924285296593801";
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputSize =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 700;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint,
     inputSize,
     inputRotation,
     inputDecay
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITwelvefoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Twelvefold Reflected Tile";
     CIAttributeFilterName = CITwelvefoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITwirlDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Twirl Distortion";
     CIAttributeFilterName = CITwirlDistortion;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "3.141592653589793";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "12.56637061435917";
     CIAttributeSliderMin = "-12.56637061435917";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIUnsharpMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategorySharpen,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Unsharp Mask";
     CIAttributeFilterName = CIUnsharpMask;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVibrance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vibrance;
     CIAttributeFilterName = CIVibrance;
     inputAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignette =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vignette;
     CIAttributeFilterName = CIVignette;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 2;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignetteEffect =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vignette Effect";
     CIAttributeFilterName = CIVignetteEffect;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputFalloff =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputIntensity,
     inputFalloff
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVortexDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vortex Distortion";
     CIAttributeFilterName = CIVortexDistortion;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "56.54866776461628";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "94.24777960769379";
     CIAttributeSliderMin = "-94.24777960769379";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIWhitePointAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "White Point Adjust";
     CIAttributeFilterName = CIWhitePointAdjust;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeIdentity = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryColorAdjustment =     (
     {
     CIColorControls =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Controls";
     CIAttributeFilterName = CIColorControls;
     inputBrightness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSaturation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSaturation,
     inputBrightness,
     inputContrast
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMatrix =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Matrix";
     CIAttributeFilterName = CIColorMatrix;
     inputAVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 1]";
     CIAttributeIdentity = "[0 0 0 1]";
     };
     inputBVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0]";
     CIAttributeIdentity = "[0 0 1 0]";
     };
     inputBiasVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0]";
     };
     inputGVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRVector,
     inputGVector,
     inputBVector,
     inputAVector,
     inputBiasVector
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExposureAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Exposure Adjust";
     CIAttributeFilterName = CIExposureAdjust;
     inputEV =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "-10";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputEV
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGammaAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gamma Adjust";
     CIAttributeFilterName = CIGammaAdjust;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPower =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = "0.25";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPower
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Adjust";
     CIAttributeFilterName = CIHueAdjust;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearToSRGBToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear to sRGB Tone Curve";
     CIAttributeFilterName = CILinearToSRGBToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISRGBToneCurveToLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "sRGB Tone Curve to Linear";
     CIAttributeFilterName = CISRGBToneCurveToLinear;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITemperatureAndTint =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Temperature and Tint";
     CIAttributeFilterName = CITemperatureAndTint;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputTargetNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputNeutral,
     inputTargetNeutral
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Tone Curve";
     CIAttributeFilterName = CIToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.25 0.25]";
     CIAttributeIdentity = "[0.25 0.25]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint2 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.5 0.5]";
     CIAttributeIdentity = "[0.5 0.5]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint3 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.75 0.75]";
     CIAttributeIdentity = "[0.75 0.75]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint4 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1]";
     CIAttributeIdentity = "[1 1]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint0,
     inputPoint1,
     inputPoint2,
     inputPoint3,
     inputPoint4
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVibrance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vibrance;
     CIAttributeFilterName = CIVibrance;
     inputAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIWhitePointAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "White Point Adjust";
     CIAttributeFilterName = CIWhitePointAdjust;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeIdentity = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryColorEffect =     (
     {
     CIColorClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Clamp";
     CIAttributeFilterName = CIColorClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1 1 1]";
     };
     inputMinComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputMinComponents,
     inputMaxComponents
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCrossPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cross Polynomial";
     CIAttributeFilterName = CIColorCrossPolynomial;
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 1 0 0 0 0 0 0 0]";
     };
     inputCoefficients =                     {
     CIAttributeClass = CIVector;
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 1 0 0 0 0 0 0 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCoefficients,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCube =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube";
     CIAttributeFilterName = CIColorCube;
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCubeWithColorSpace =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube with ColorSpace";
     CIAttributeFilterName = CIColorCubeWithColorSpace;
     inputColorSpace =                     {
     CIAttributeClass = NSObject;
     };
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData,
     inputColorSpace
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorInvert =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Invert";
     CIAttributeFilterName = CIColorInvert;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMap =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Map";
     CIAttributeFilterName = CIColorMap;
     inputGradientImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputGradientImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMonochrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Monochrome";
     CIAttributeFilterName = CIColorMonochrome;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 0.45 0.3 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Polynomial";
     CIAttributeFilterName = CIColorPolynomial;
     inputAlphaCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients,
     inputAlphaCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPosterize =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Posterize";
     CIAttributeFilterName = CIColorPosterize;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLevels =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeIdentity = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 30;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputLevels
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFalseColor =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "False Color";
     CIAttributeFilterName = CIFalseColor;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.3 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.9 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaskToAlpha =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Mask to Alpha";
     CIAttributeFilterName = CIMaskToAlpha;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Maximum Component";
     CIAttributeFilterName = CIMaximumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Minimum Component";
     CIAttributeFilterName = CIMinimumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectChrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Chrome";
     CIAttributeFilterName = CIPhotoEffectChrome;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectFade =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Fade";
     CIAttributeFilterName = CIPhotoEffectFade;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectInstant =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Instant";
     CIAttributeFilterName = CIPhotoEffectInstant;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectMono =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Mono";
     CIAttributeFilterName = CIPhotoEffectMono;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectNoir =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Noir";
     CIAttributeFilterName = CIPhotoEffectNoir;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectProcess =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Process";
     CIAttributeFilterName = CIPhotoEffectProcess;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTonal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Tonal";
     CIAttributeFilterName = CIPhotoEffectTonal;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTransfer =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Transfer";
     CIAttributeFilterName = CIPhotoEffectTransfer;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISepiaTone =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Sepia Tone";
     CIAttributeFilterName = CISepiaTone;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignette =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vignette;
     CIAttributeFilterName = CIVignette;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 2;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignetteEffect =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vignette Effect";
     CIAttributeFilterName = CIVignetteEffect;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputFalloff =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputIntensity,
     inputFalloff
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryCompositeOperation =     (
     {
     CIAdditionCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Addition;
     CIAttributeFilterName = CIAdditionCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Blend Mode";
     CIAttributeFilterName = CIColorBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Burn Blend Mode";
     CIAttributeFilterName = CIColorBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Dodge Blend Mode";
     CIAttributeFilterName = CIColorDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDarkenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Darken Blend Mode";
     CIAttributeFilterName = CIDarkenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDifferenceBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Difference Blend Mode";
     CIAttributeFilterName = CIDifferenceBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDivideBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Divide Blend Mode";
     CIAttributeFilterName = CIDivideBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExclusionBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Exclusion Blend Mode";
     CIAttributeFilterName = CIExclusionBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHardLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hard Light Blend Mode";
     CIAttributeFilterName = CIHardLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Blend Mode";
     CIAttributeFilterName = CIHueBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lighten Blend Mode";
     CIAttributeFilterName = CILightenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Burn Blend Mode";
     CIAttributeFilterName = CILinearBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Dodge Blend Mode";
     CIAttributeFilterName = CILinearDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILuminosityBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Luminosity Blend Mode";
     CIAttributeFilterName = CILuminosityBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Maximum;
     CIAttributeFilterName = CIMaximumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Minimum;
     CIAttributeFilterName = CIMinimumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Multiply Blend Mode";
     CIAttributeFilterName = CIMultiplyBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Multiply;
     CIAttributeFilterName = CIMultiplyCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIOverlayBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Overlay Blend Mode";
     CIAttributeFilterName = CIOverlayBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pin Light Mode";
     CIAttributeFilterName = CIPinLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISaturationBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Saturation Blend Mode";
     CIAttributeFilterName = CISaturationBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIScreenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Screen Blend Mode";
     CIAttributeFilterName = CIScreenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISoftLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Soft Light Blend Mode";
     CIAttributeFilterName = CISoftLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceAtopCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Atop";
     CIAttributeFilterName = CISourceAtopCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceInCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source In";
     CIAttributeFilterName = CISourceInCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOutCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Out";
     CIAttributeFilterName = CISourceOutCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOverCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Over";
     CIAttributeFilterName = CISourceOverCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISubtractBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Subtract Blend Mode";
     CIAttributeFilterName = CISubtractBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryDistortionEffect =     (
     {
     CIBumpDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bump Distortion";
     CIAttributeFilterName = CIBumpDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 600;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBumpDistortionLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bump Distortion Linear";
     CIAttributeFilterName = CIBumpDistortionLinear;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 600;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICircleSplashDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Circle Splash Distortion";
     CIAttributeFilterName = CICircleSplashDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGlassDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Glass Distortion";
     CIAttributeFilterName = CIGlassDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 200;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = "0.01";
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTexture =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTexture,
     inputCenter,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHoleDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hole Distortion";
     CIAttributeFilterName = CIHoleDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeIdentity = "0.1";
     CIAttributeMin = "0.01";
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = "0.01";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightTunnel =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Light Tunnel";
     CIAttributeFilterName = CILightTunnel;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputRotation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "1.570796326794897";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRotation,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinchDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pinch Distortion";
     CIAttributeFilterName = CIPinchDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITwirlDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Twirl Distortion";
     CIAttributeFilterName = CITwirlDistortion;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "3.141592653589793";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "12.56637061435917";
     CIAttributeSliderMin = "-12.56637061435917";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVortexDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vortex Distortion";
     CIAttributeFilterName = CIVortexDistortion;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "56.54866776461628";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "94.24777960769379";
     CIAttributeSliderMin = "-94.24777960769379";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryGenerator =     (
     {
     CIAztecCodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Aztec Code Generator";
     CIAttributeFilterName = CIAztecCodeGenerator;
     inputCompactStyle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     };
     inputCorrectionLevel =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 23;
     CIAttributeMax = 95;
     CIAttributeMin = 5;
     CIAttributeSliderMax = 95;
     CIAttributeSliderMin = 5;
     };
     inputLayers =                     {
     CIAttributeClass = NSNumber;
     CIAttributeMax = 32;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 32;
     CIAttributeSliderMin = 1;
     };
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputCorrectionLevel,
     inputLayers,
     inputCompactStyle
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CICheckerboardGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Checkerboard;
     CIAttributeFilterName = CICheckerboardGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 80;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICode128BarcodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Code128 Barcode Generator";
     CIAttributeFilterName = CICode128BarcodeGenerator;
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     inputQuietSpace =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 7;
     CIAttributeMax = 20;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 20;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputQuietSpace
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIConstantColorGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Constant Color";
     CIAttributeFilterName = CIConstantColorGenerator;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     };
     "filter inputKeys" =                 (
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIQRCodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "QRCode Generator";
     CIAttributeFilterName = CIQRCodeGenerator;
     inputCorrectionLevel =                     {
     CIAttributeClass = NSString;
     CIAttributeDefault = M;
     };
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputCorrectionLevel
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIRandomGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Random Generator";
     CIAttributeFilterName = CIRandomGenerator;
     };
     "filter inputKeys" =                 (
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStarShineGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Star Shine";
     CIAttributeFilterName = CIStarShineGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.8 0.6 1)";
     };
     inputCrossAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.6";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCrossOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "-2";
     CIAttributeMin = "-8";
     CIAttributeSliderMax = 0;
     CIAttributeSliderMin = "-8";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputCrossScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 15;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputCrossWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.5";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "0.5";
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputEpsilon =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "-2";
     CIAttributeMin = "-8";
     CIAttributeSliderMax = 0;
     CIAttributeSliderMin = "-8";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 50;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 300;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor,
     inputRadius,
     inputCrossScale,
     inputCrossAngle,
     inputCrossOpacity,
     inputCrossWidth,
     inputEpsilon
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStripesGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Stripes;
     CIAttributeFilterName = CIStripesGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 80;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryGeometryAdjustment =     (
     {
     CIAffineTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Transform";
     CIAttributeFilterName = CIAffineTransform;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeType = CIAttributeTypeTransform;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICrop =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Crop;
     CIAttributeFilterName = CICrop;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRectangle =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]";
     CIAttributeIdentity = "[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRectangle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILanczosScaleTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lanczos Scale Transform";
     CIAttributeFilterName = CILanczosScaleTransform;
     inputAspectRatio =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "2.5";
     CIAttributeSliderMin = "0.05";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "1.5";
     CIAttributeSliderMin = "0.05";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputScale,
     inputAspectRatio
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveCorrection =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Perspective Correction";
     CIAttributeFilterName = CIPerspectiveCorrection;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Tile";
     CIAttributeFilterName = CIPerspectiveTile;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Transform";
     CIAttributeFilterName = CIPerspectiveTransform;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTransformWithExtent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Transform with Extent";
     CIAttributeFilterName = CIPerspectiveTransformWithExtent;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputExtent,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStraightenFilter =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Straighten;
     CIAttributeFilterName = CIStraightenFilter;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryGradient =     (
     {
     CIGaussianGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gaussian Gradient";
     CIAttributeFilterName = CIGaussianGradient;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 0)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Gradient";
     CIAttributeFilterName = CILinearGradient;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[200 200]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputPoint0,
     inputPoint1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIRadialGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Radial Gradient";
     CIAttributeFilterName = CIRadialGradient;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputRadius0 =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 5;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputRadius1 =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputRadius0,
     inputRadius1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISmoothLinearGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Smooth Linear Gradient";
     CIAttributeFilterName = CISmoothLinearGradient;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[200 200]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputPoint0,
     inputPoint1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryHalftoneEffect =     (
     {
     CICircularScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Circular Screen";
     CIAttributeFilterName = CICircularScreen;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDotScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Dot Screen";
     CIAttributeFilterName = CIDotScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHatchedScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hatched Screen";
     CIAttributeFilterName = CIHatchedScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILineScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Line Screen";
     CIAttributeFilterName = CILineScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryHighDynamicRange =     (
     {
     CIAdditionCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Addition;
     CIAttributeFilterName = CIAdditionCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Maximum;
     CIAttributeFilterName = CIMaximumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Minimum;
     CIAttributeFilterName = CIMinimumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Multiply;
     CIAttributeFilterName = CIMultiplyCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceAtopCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Atop";
     CIAttributeFilterName = CISourceAtopCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceInCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source In";
     CIAttributeFilterName = CISourceInCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOutCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Out";
     CIAttributeFilterName = CISourceOutCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOverCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Over";
     CIAttributeFilterName = CISourceOverCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryInterlaced =     (
     {
     CIAdditionCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Addition;
     CIAttributeFilterName = CIAdditionCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Blend Mode";
     CIAttributeFilterName = CIColorBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Burn Blend Mode";
     CIAttributeFilterName = CIColorBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Clamp";
     CIAttributeFilterName = CIColorClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1 1 1]";
     };
     inputMinComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputMinComponents,
     inputMaxComponents
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorControls =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Controls";
     CIAttributeFilterName = CIColorControls;
     inputBrightness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSaturation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSaturation,
     inputBrightness,
     inputContrast
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCrossPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cross Polynomial";
     CIAttributeFilterName = CIColorCrossPolynomial;
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 1 0 0 0 0 0 0 0]";
     };
     inputCoefficients =                     {
     CIAttributeClass = CIVector;
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 1 0 0 0 0 0 0 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCoefficients,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCube =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube";
     CIAttributeFilterName = CIColorCube;
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCubeWithColorSpace =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube with ColorSpace";
     CIAttributeFilterName = CIColorCubeWithColorSpace;
     inputColorSpace =                     {
     CIAttributeClass = NSObject;
     };
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData,
     inputColorSpace
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Dodge Blend Mode";
     CIAttributeFilterName = CIColorDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorInvert =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Invert";
     CIAttributeFilterName = CIColorInvert;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMap =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Map";
     CIAttributeFilterName = CIColorMap;
     inputGradientImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputGradientImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMatrix =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Matrix";
     CIAttributeFilterName = CIColorMatrix;
     inputAVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 1]";
     CIAttributeIdentity = "[0 0 0 1]";
     };
     inputBVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0]";
     CIAttributeIdentity = "[0 0 1 0]";
     };
     inputBiasVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0]";
     };
     inputGVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRVector,
     inputGVector,
     inputBVector,
     inputAVector,
     inputBiasVector
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMonochrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Monochrome";
     CIAttributeFilterName = CIColorMonochrome;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 0.45 0.3 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Polynomial";
     CIAttributeFilterName = CIColorPolynomial;
     inputAlphaCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients,
     inputAlphaCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPosterize =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Posterize";
     CIAttributeFilterName = CIColorPosterize;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLevels =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeIdentity = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 30;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputLevels
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDarkenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Darken Blend Mode";
     CIAttributeFilterName = CIDarkenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDifferenceBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Difference Blend Mode";
     CIAttributeFilterName = CIDifferenceBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDissolveTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Dissolve;
     CIAttributeFilterName = CIDissolveTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDivideBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Divide Blend Mode";
     CIAttributeFilterName = CIDivideBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExclusionBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Exclusion Blend Mode";
     CIAttributeFilterName = CIExclusionBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExposureAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Exposure Adjust";
     CIAttributeFilterName = CIExposureAdjust;
     inputEV =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "-10";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputEV
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFalseColor =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "False Color";
     CIAttributeFilterName = CIFalseColor;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.3 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.9 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGammaAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gamma Adjust";
     CIAttributeFilterName = CIGammaAdjust;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPower =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = "0.25";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPower
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHardLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hard Light Blend Mode";
     CIAttributeFilterName = CIHardLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Adjust";
     CIAttributeFilterName = CIHueAdjust;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Blend Mode";
     CIAttributeFilterName = CIHueBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lighten Blend Mode";
     CIAttributeFilterName = CILightenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Burn Blend Mode";
     CIAttributeFilterName = CILinearBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Dodge Blend Mode";
     CIAttributeFilterName = CILinearDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearToSRGBToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear to sRGB Tone Curve";
     CIAttributeFilterName = CILinearToSRGBToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILuminosityBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Luminosity Blend Mode";
     CIAttributeFilterName = CILuminosityBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaskToAlpha =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Mask to Alpha";
     CIAttributeFilterName = CIMaskToAlpha;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Maximum Component";
     CIAttributeFilterName = CIMaximumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Maximum;
     CIAttributeFilterName = CIMaximumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Minimum Component";
     CIAttributeFilterName = CIMinimumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Minimum;
     CIAttributeFilterName = CIMinimumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Multiply Blend Mode";
     CIAttributeFilterName = CIMultiplyBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Multiply;
     CIAttributeFilterName = CIMultiplyCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIOverlayBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Overlay Blend Mode";
     CIAttributeFilterName = CIOverlayBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectChrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Chrome";
     CIAttributeFilterName = CIPhotoEffectChrome;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectFade =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Fade";
     CIAttributeFilterName = CIPhotoEffectFade;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectInstant =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Instant";
     CIAttributeFilterName = CIPhotoEffectInstant;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectMono =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Mono";
     CIAttributeFilterName = CIPhotoEffectMono;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectNoir =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Noir";
     CIAttributeFilterName = CIPhotoEffectNoir;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectProcess =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Process";
     CIAttributeFilterName = CIPhotoEffectProcess;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTonal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Tonal";
     CIAttributeFilterName = CIPhotoEffectTonal;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTransfer =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Transfer";
     CIAttributeFilterName = CIPhotoEffectTransfer;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pin Light Mode";
     CIAttributeFilterName = CIPinLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISaturationBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Saturation Blend Mode";
     CIAttributeFilterName = CISaturationBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIScreenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Screen Blend Mode";
     CIAttributeFilterName = CIScreenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISepiaTone =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Sepia Tone";
     CIAttributeFilterName = CISepiaTone;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISoftLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Soft Light Blend Mode";
     CIAttributeFilterName = CISoftLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceAtopCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Atop";
     CIAttributeFilterName = CISourceAtopCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceInCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source In";
     CIAttributeFilterName = CISourceInCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOutCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Out";
     CIAttributeFilterName = CISourceOutCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOverCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Over";
     CIAttributeFilterName = CISourceOverCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISRGBToneCurveToLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "sRGB Tone Curve to Linear";
     CIAttributeFilterName = CISRGBToneCurveToLinear;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISubtractBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Subtract Blend Mode";
     CIAttributeFilterName = CISubtractBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITemperatureAndTint =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Temperature and Tint";
     CIAttributeFilterName = CITemperatureAndTint;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputTargetNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputNeutral,
     inputTargetNeutral
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Tone Curve";
     CIAttributeFilterName = CIToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.25 0.25]";
     CIAttributeIdentity = "[0.25 0.25]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint2 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.5 0.5]";
     CIAttributeIdentity = "[0.5 0.5]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint3 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.75 0.75]";
     CIAttributeIdentity = "[0.75 0.75]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint4 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1]";
     CIAttributeIdentity = "[1 1]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint0,
     inputPoint1,
     inputPoint2,
     inputPoint3,
     inputPoint4
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVibrance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vibrance;
     CIAttributeFilterName = CIVibrance;
     inputAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignette =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vignette;
     CIAttributeFilterName = CIVignette;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 2;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignetteEffect =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vignette Effect";
     CIAttributeFilterName = CIVignetteEffect;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputFalloff =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputIntensity,
     inputFalloff
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIWhitePointAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "White Point Adjust";
     CIAttributeFilterName = CIWhitePointAdjust;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeIdentity = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryNonSquarePixels =     (
     {
     CIAdditionCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Addition;
     CIAttributeFilterName = CIAdditionCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Blend Mode";
     CIAttributeFilterName = CIColorBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Burn Blend Mode";
     CIAttributeFilterName = CIColorBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Clamp";
     CIAttributeFilterName = CIColorClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1 1 1]";
     };
     inputMinComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputMinComponents,
     inputMaxComponents
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorControls =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Controls";
     CIAttributeFilterName = CIColorControls;
     inputBrightness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSaturation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSaturation,
     inputBrightness,
     inputContrast
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCrossPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cross Polynomial";
     CIAttributeFilterName = CIColorCrossPolynomial;
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 1 0 0 0 0 0 0 0]";
     };
     inputCoefficients =                     {
     CIAttributeClass = CIVector;
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 1 0 0 0 0 0 0 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCoefficients,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCube =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube";
     CIAttributeFilterName = CIColorCube;
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCubeWithColorSpace =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube with ColorSpace";
     CIAttributeFilterName = CIColorCubeWithColorSpace;
     inputColorSpace =                     {
     CIAttributeClass = NSObject;
     };
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData,
     inputColorSpace
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Dodge Blend Mode";
     CIAttributeFilterName = CIColorDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorInvert =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Invert";
     CIAttributeFilterName = CIColorInvert;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMap =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Map";
     CIAttributeFilterName = CIColorMap;
     inputGradientImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputGradientImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMatrix =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Matrix";
     CIAttributeFilterName = CIColorMatrix;
     inputAVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 1]";
     CIAttributeIdentity = "[0 0 0 1]";
     };
     inputBVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0]";
     CIAttributeIdentity = "[0 0 1 0]";
     };
     inputBiasVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0]";
     };
     inputGVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRVector,
     inputGVector,
     inputBVector,
     inputAVector,
     inputBiasVector
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMonochrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Monochrome";
     CIAttributeFilterName = CIColorMonochrome;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 0.45 0.3 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Polynomial";
     CIAttributeFilterName = CIColorPolynomial;
     inputAlphaCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients,
     inputAlphaCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPosterize =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Posterize";
     CIAttributeFilterName = CIColorPosterize;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLevels =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeIdentity = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 30;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputLevels
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDarkenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Darken Blend Mode";
     CIAttributeFilterName = CIDarkenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDifferenceBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Difference Blend Mode";
     CIAttributeFilterName = CIDifferenceBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDissolveTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Dissolve;
     CIAttributeFilterName = CIDissolveTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDivideBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Divide Blend Mode";
     CIAttributeFilterName = CIDivideBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExclusionBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Exclusion Blend Mode";
     CIAttributeFilterName = CIExclusionBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExposureAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Exposure Adjust";
     CIAttributeFilterName = CIExposureAdjust;
     inputEV =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "-10";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputEV
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFalseColor =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "False Color";
     CIAttributeFilterName = CIFalseColor;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.3 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.9 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGammaAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gamma Adjust";
     CIAttributeFilterName = CIGammaAdjust;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPower =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = "0.25";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPower
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHardLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hard Light Blend Mode";
     CIAttributeFilterName = CIHardLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Adjust";
     CIAttributeFilterName = CIHueAdjust;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Blend Mode";
     CIAttributeFilterName = CIHueBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lighten Blend Mode";
     CIAttributeFilterName = CILightenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Burn Blend Mode";
     CIAttributeFilterName = CILinearBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Dodge Blend Mode";
     CIAttributeFilterName = CILinearDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearToSRGBToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear to sRGB Tone Curve";
     CIAttributeFilterName = CILinearToSRGBToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILuminosityBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Luminosity Blend Mode";
     CIAttributeFilterName = CILuminosityBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaskToAlpha =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Mask to Alpha";
     CIAttributeFilterName = CIMaskToAlpha;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Maximum Component";
     CIAttributeFilterName = CIMaximumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Maximum;
     CIAttributeFilterName = CIMaximumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Minimum Component";
     CIAttributeFilterName = CIMinimumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Minimum;
     CIAttributeFilterName = CIMinimumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Multiply Blend Mode";
     CIAttributeFilterName = CIMultiplyBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Multiply;
     CIAttributeFilterName = CIMultiplyCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIOverlayBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Overlay Blend Mode";
     CIAttributeFilterName = CIOverlayBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectChrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Chrome";
     CIAttributeFilterName = CIPhotoEffectChrome;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectFade =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Fade";
     CIAttributeFilterName = CIPhotoEffectFade;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectInstant =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Instant";
     CIAttributeFilterName = CIPhotoEffectInstant;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectMono =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Mono";
     CIAttributeFilterName = CIPhotoEffectMono;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectNoir =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Noir";
     CIAttributeFilterName = CIPhotoEffectNoir;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectProcess =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Process";
     CIAttributeFilterName = CIPhotoEffectProcess;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTonal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Tonal";
     CIAttributeFilterName = CIPhotoEffectTonal;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTransfer =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Transfer";
     CIAttributeFilterName = CIPhotoEffectTransfer;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pin Light Mode";
     CIAttributeFilterName = CIPinLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISaturationBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Saturation Blend Mode";
     CIAttributeFilterName = CISaturationBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIScreenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Screen Blend Mode";
     CIAttributeFilterName = CIScreenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISepiaTone =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Sepia Tone";
     CIAttributeFilterName = CISepiaTone;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISoftLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Soft Light Blend Mode";
     CIAttributeFilterName = CISoftLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceAtopCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Atop";
     CIAttributeFilterName = CISourceAtopCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceInCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source In";
     CIAttributeFilterName = CISourceInCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOutCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Out";
     CIAttributeFilterName = CISourceOutCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOverCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Over";
     CIAttributeFilterName = CISourceOverCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISRGBToneCurveToLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "sRGB Tone Curve to Linear";
     CIAttributeFilterName = CISRGBToneCurveToLinear;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISubtractBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Subtract Blend Mode";
     CIAttributeFilterName = CISubtractBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITemperatureAndTint =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Temperature and Tint";
     CIAttributeFilterName = CITemperatureAndTint;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputTargetNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputNeutral,
     inputTargetNeutral
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Tone Curve";
     CIAttributeFilterName = CIToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.25 0.25]";
     CIAttributeIdentity = "[0.25 0.25]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint2 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.5 0.5]";
     CIAttributeIdentity = "[0.5 0.5]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint3 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.75 0.75]";
     CIAttributeIdentity = "[0.75 0.75]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint4 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1]";
     CIAttributeIdentity = "[1 1]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint0,
     inputPoint1,
     inputPoint2,
     inputPoint3,
     inputPoint4
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVibrance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vibrance;
     CIAttributeFilterName = CIVibrance;
     inputAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIWhitePointAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "White Point Adjust";
     CIAttributeFilterName = CIWhitePointAdjust;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeIdentity = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryReduction =     (
     {
     CIAreaHistogram =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryReduction,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Area Histogram";
     CIAttributeFilterName = CIAreaHistogram;
     inputCount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 64;
     CIAttributeMax = 256;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 256;
     CIAttributeSliderMin = 10;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputExtent,
     inputScale,
     inputCount
     );
     "filter outputKeys" =                 (
     outputImage,
     outputData
     );
     };
     },
     {
     CIHistogramDisplayFilter =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryReduction,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Histogram Display";
     CIAttributeFilterName = CIHistogramDisplayFilter;
     inputHeight =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 200;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputHighLimit =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLowLimit =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputHeight,
     inputHighLimit,
     inputLowLimit
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategorySharpen =     (
     {
     CISharpenLuminance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategorySharpen,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sharpen Luminance";
     CIAttributeFilterName = CISharpenLuminance;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.4";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIUnsharpMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategorySharpen,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Unsharp Mask";
     CIAttributeFilterName = CIUnsharpMask;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryStillImage =     (
     {
     CIAccordionFoldTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Accordion Fold Transition";
     CIAttributeFilterName = CIAccordionFoldTransition;
     inputBottomHeight =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputFoldShadowAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.1";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNumberOfFolds =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 3;
     CIAttributeMax = 50;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputBottomHeight,
     inputNumberOfFolds,
     inputFoldShadowAmount,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAdditionCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Addition;
     CIAttributeFilterName = CIAdditionCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Clamp";
     CIAttributeFilterName = CIAffineClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Tile";
     CIAttributeFilterName = CIAffineTile;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Transform";
     CIAttributeFilterName = CIAffineTransform;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeType = CIAttributeTypeTransform;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAreaHistogram =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryReduction,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Area Histogram";
     CIAttributeFilterName = CIAreaHistogram;
     inputCount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 64;
     CIAttributeMax = 256;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 256;
     CIAttributeSliderMin = 10;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputExtent,
     inputScale,
     inputCount
     );
     "filter outputKeys" =                 (
     outputImage,
     outputData
     );
     };
     },
     {
     CIAztecCodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Aztec Code Generator";
     CIAttributeFilterName = CIAztecCodeGenerator;
     inputCompactStyle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     };
     inputCorrectionLevel =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 23;
     CIAttributeMax = 95;
     CIAttributeMin = 5;
     CIAttributeSliderMax = 95;
     CIAttributeSliderMin = 5;
     };
     inputLayers =                     {
     CIAttributeClass = NSNumber;
     CIAttributeMax = 32;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 32;
     CIAttributeSliderMin = 1;
     };
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputCorrectionLevel,
     inputLayers,
     inputCompactStyle
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIBarsSwipeTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bars Swipe Transition";
     CIAttributeFilterName = CIBarsSwipeTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "3.141592653589793";
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputBarOffset =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 30;
     CIAttributeMin = 2;
     CIAttributeSliderMax = 300;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputAngle,
     inputWidth,
     inputBarOffset,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBlendWithAlphaMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Blend With Alpha Mask";
     CIAttributeFilterName = CIBlendWithAlphaMask;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage,
     inputMaskImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBlendWithMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Blend With Mask";
     CIAttributeFilterName = CIBlendWithMask;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage,
     inputMaskImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBloom =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Bloom;
     CIAttributeFilterName = CIBloom;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBumpDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bump Distortion";
     CIAttributeFilterName = CIBumpDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 600;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBumpDistortionLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bump Distortion Linear";
     CIAttributeFilterName = CIBumpDistortionLinear;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 600;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICheckerboardGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Checkerboard;
     CIAttributeFilterName = CICheckerboardGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 80;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICircleSplashDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Circle Splash Distortion";
     CIAttributeFilterName = CICircleSplashDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICircularScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Circular Screen";
     CIAttributeFilterName = CICircularScreen;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICode128BarcodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Code128 Barcode Generator";
     CIAttributeFilterName = CICode128BarcodeGenerator;
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     inputQuietSpace =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 7;
     CIAttributeMax = 20;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 20;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputQuietSpace
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIColorBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Blend Mode";
     CIAttributeFilterName = CIColorBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Burn Blend Mode";
     CIAttributeFilterName = CIColorBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Clamp";
     CIAttributeFilterName = CIColorClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1 1 1]";
     };
     inputMinComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputMinComponents,
     inputMaxComponents
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorControls =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Controls";
     CIAttributeFilterName = CIColorControls;
     inputBrightness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSaturation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSaturation,
     inputBrightness,
     inputContrast
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCrossPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cross Polynomial";
     CIAttributeFilterName = CIColorCrossPolynomial;
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 1 0 0 0 0 0 0 0]";
     };
     inputCoefficients =                     {
     CIAttributeClass = CIVector;
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 1 0 0 0 0 0 0 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCoefficients,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCube =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube";
     CIAttributeFilterName = CIColorCube;
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCubeWithColorSpace =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube with ColorSpace";
     CIAttributeFilterName = CIColorCubeWithColorSpace;
     inputColorSpace =                     {
     CIAttributeClass = NSObject;
     };
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData,
     inputColorSpace
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Dodge Blend Mode";
     CIAttributeFilterName = CIColorDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorInvert =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Invert";
     CIAttributeFilterName = CIColorInvert;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMap =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Map";
     CIAttributeFilterName = CIColorMap;
     inputGradientImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputGradientImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMatrix =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Matrix";
     CIAttributeFilterName = CIColorMatrix;
     inputAVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 1]";
     CIAttributeIdentity = "[0 0 0 1]";
     };
     inputBVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0]";
     CIAttributeIdentity = "[0 0 1 0]";
     };
     inputBiasVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0]";
     };
     inputGVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRVector,
     inputGVector,
     inputBVector,
     inputAVector,
     inputBiasVector
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMonochrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Monochrome";
     CIAttributeFilterName = CIColorMonochrome;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 0.45 0.3 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Polynomial";
     CIAttributeFilterName = CIColorPolynomial;
     inputAlphaCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients,
     inputAlphaCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPosterize =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Posterize";
     CIAttributeFilterName = CIColorPosterize;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLevels =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeIdentity = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 30;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputLevels
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConstantColorGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Constant Color";
     CIAttributeFilterName = CIConstantColorGenerator;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     };
     "filter inputKeys" =                 (
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution3X3 =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "3X3 Convolution";
     CIAttributeFilterName = CIConvolution3X3;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution5X5 =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "5X5 Convolution";
     CIAttributeFilterName = CIConvolution5X5;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution9Horizontal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Horizontal 9 Convolution";
     CIAttributeFilterName = CIConvolution9Horizontal;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution9Vertical =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vertical 9 Convolution";
     CIAttributeFilterName = CIConvolution9Vertical;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICopyMachineTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Copy Machine";
     CIAttributeFilterName = CICopyMachineTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 1 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.3";
     CIAttributeIdentity = "1.3";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 3;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 200;
     CIAttributeIdentity = 200;
     CIAttributeMin = "0.1";
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = "0.1";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputExtent,
     inputColor,
     inputTime,
     inputAngle,
     inputWidth,
     inputOpacity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICrop =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Crop;
     CIAttributeFilterName = CICrop;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRectangle =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]";
     CIAttributeIdentity = "[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRectangle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDarkenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Darken Blend Mode";
     CIAttributeFilterName = CIDarkenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDifferenceBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Difference Blend Mode";
     CIAttributeFilterName = CIDifferenceBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDisintegrateWithMaskTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Disintegrate With Mask";
     CIAttributeFilterName = CIDisintegrateWithMaskTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputShadowDensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.65";
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowOffset =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 -10]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputShadowRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 8;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputMaskImage,
     inputTime,
     inputShadowRadius,
     inputShadowDensity,
     inputShadowOffset
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDissolveTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Dissolve;
     CIAttributeFilterName = CIDissolveTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDivideBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Divide Blend Mode";
     CIAttributeFilterName = CIDivideBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDotScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Dot Screen";
     CIAttributeFilterName = CIDotScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIEightfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Eightfold Reflected Tile";
     CIAttributeFilterName = CIEightfoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExclusionBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Exclusion Blend Mode";
     CIAttributeFilterName = CIExclusionBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExposureAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Exposure Adjust";
     CIAttributeFilterName = CIExposureAdjust;
     inputEV =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "-10";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputEV
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFalseColor =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "False Color";
     CIAttributeFilterName = CIFalseColor;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.3 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.9 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFlashTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Flash;
     CIAttributeFilterName = CIFlashTransition;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.8 0.6 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputFadeThreshold =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.85";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxStriationRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.58";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputStriationContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.375";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 5;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputStriationStrength =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 3;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputCenter,
     inputExtent,
     inputColor,
     inputTime,
     inputMaxStriationRadius,
     inputStriationStrength,
     inputStriationContrast,
     inputFadeThreshold
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Reflected Tile";
     CIAttributeFilterName = CIFourfoldReflectedTile;
     inputAcuteAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.570796326794897";
     CIAttributeIdentity = "1.570796326794897";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputAcuteAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldRotatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Rotated Tile";
     CIAttributeFilterName = CIFourfoldRotatedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldTranslatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Translated Tile";
     CIAttributeFilterName = CIFourfoldTranslatedTile;
     inputAcuteAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.570796326794897";
     CIAttributeIdentity = "1.570796326794897";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputAcuteAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGammaAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gamma Adjust";
     CIAttributeFilterName = CIGammaAdjust;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPower =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = "0.25";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPower
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGaussianBlur =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryBlur,
     CICategoryStillImage,
     CICategoryVideo,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gaussian Blur";
     CIAttributeFilterName = CIGaussianBlur;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGaussianGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gaussian Gradient";
     CIAttributeFilterName = CIGaussianGradient;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 0)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGlassDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Glass Distortion";
     CIAttributeFilterName = CIGlassDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 200;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = "0.01";
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTexture =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTexture,
     inputCenter,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGlideReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Glide Reflected Tile";
     CIAttributeFilterName = CIGlideReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGloom =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Gloom;
     CIAttributeFilterName = CIGloom;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHardLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hard Light Blend Mode";
     CIAttributeFilterName = CIHardLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHatchedScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hatched Screen";
     CIAttributeFilterName = CIHatchedScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHighlightShadowAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Highlights and Shadows";
     CIAttributeFilterName = CIHighlightShadowAdjust;
     inputHighlightAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "0.3";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputShadowAmount,
     inputHighlightAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHistogramDisplayFilter =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryReduction,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Histogram Display";
     CIAttributeFilterName = CIHistogramDisplayFilter;
     inputHeight =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 200;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputHighLimit =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLowLimit =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputHeight,
     inputHighLimit,
     inputLowLimit
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHoleDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hole Distortion";
     CIAttributeFilterName = CIHoleDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeIdentity = "0.1";
     CIAttributeMin = "0.01";
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = "0.01";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Adjust";
     CIAttributeFilterName = CIHueAdjust;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Blend Mode";
     CIAttributeFilterName = CIHueBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILanczosScaleTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lanczos Scale Transform";
     CIAttributeFilterName = CILanczosScaleTransform;
     inputAspectRatio =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "2.5";
     CIAttributeSliderMin = "0.05";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "1.5";
     CIAttributeSliderMin = "0.05";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputScale,
     inputAspectRatio
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lighten Blend Mode";
     CIAttributeFilterName = CILightenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightTunnel =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Light Tunnel";
     CIAttributeFilterName = CILightTunnel;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputRotation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "1.570796326794897";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRotation,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Burn Blend Mode";
     CIAttributeFilterName = CILinearBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Dodge Blend Mode";
     CIAttributeFilterName = CILinearDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Gradient";
     CIAttributeFilterName = CILinearGradient;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[200 200]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputPoint0,
     inputPoint1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearToSRGBToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear to sRGB Tone Curve";
     CIAttributeFilterName = CILinearToSRGBToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILineScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Line Screen";
     CIAttributeFilterName = CILineScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILuminosityBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Luminosity Blend Mode";
     CIAttributeFilterName = CILuminosityBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaskToAlpha =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Mask to Alpha";
     CIAttributeFilterName = CIMaskToAlpha;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Maximum Component";
     CIAttributeFilterName = CIMaximumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Maximum;
     CIAttributeFilterName = CIMaximumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Minimum Component";
     CIAttributeFilterName = CIMinimumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Minimum;
     CIAttributeFilterName = CIMinimumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIModTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Mod;
     CIAttributeFilterName = CIModTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = "-6.283185307179586";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputCompression =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 100;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputCenter,
     inputTime,
     inputAngle,
     inputRadius,
     inputCompression
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Multiply Blend Mode";
     CIAttributeFilterName = CIMultiplyBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Multiply;
     CIAttributeFilterName = CIMultiplyCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIOverlayBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Overlay Blend Mode";
     CIAttributeFilterName = CIOverlayBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveCorrection =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Perspective Correction";
     CIAttributeFilterName = CIPerspectiveCorrection;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Tile";
     CIAttributeFilterName = CIPerspectiveTile;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Transform";
     CIAttributeFilterName = CIPerspectiveTransform;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTransformWithExtent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Transform with Extent";
     CIAttributeFilterName = CIPerspectiveTransformWithExtent;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputExtent,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectChrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Chrome";
     CIAttributeFilterName = CIPhotoEffectChrome;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectFade =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Fade";
     CIAttributeFilterName = CIPhotoEffectFade;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectInstant =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Instant";
     CIAttributeFilterName = CIPhotoEffectInstant;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectMono =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Mono";
     CIAttributeFilterName = CIPhotoEffectMono;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectNoir =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Noir";
     CIAttributeFilterName = CIPhotoEffectNoir;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectProcess =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Process";
     CIAttributeFilterName = CIPhotoEffectProcess;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTonal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Tonal";
     CIAttributeFilterName = CIPhotoEffectTonal;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTransfer =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Transfer";
     CIAttributeFilterName = CIPhotoEffectTransfer;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinchDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pinch Distortion";
     CIAttributeFilterName = CIPinchDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pin Light Mode";
     CIAttributeFilterName = CIPinLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPixellate =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Pixelate;
     CIAttributeFilterName = CIPixellate;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 8;
     CIAttributeIdentity = 1;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIQRCodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "QRCode Generator";
     CIAttributeFilterName = CIQRCodeGenerator;
     inputCorrectionLevel =                     {
     CIAttributeClass = NSString;
     CIAttributeDefault = M;
     };
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputCorrectionLevel
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIRadialGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Radial Gradient";
     CIAttributeFilterName = CIRadialGradient;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputRadius0 =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 5;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputRadius1 =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputRadius0,
     inputRadius1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIRandomGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Random Generator";
     CIAttributeFilterName = CIRandomGenerator;
     };
     "filter inputKeys" =                 (
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISaturationBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Saturation Blend Mode";
     CIAttributeFilterName = CISaturationBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIScreenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Screen Blend Mode";
     CIAttributeFilterName = CIScreenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISepiaTone =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Sepia Tone";
     CIAttributeFilterName = CISepiaTone;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISharpenLuminance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategorySharpen,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sharpen Luminance";
     CIAttributeFilterName = CISharpenLuminance;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.4";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISixfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sixfold Reflected Tile";
     CIAttributeFilterName = CISixfoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISixfoldRotatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sixfold Rotated Tile";
     CIAttributeFilterName = CISixfoldRotatedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISmoothLinearGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Smooth Linear Gradient";
     CIAttributeFilterName = CISmoothLinearGradient;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[200 200]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputPoint0,
     inputPoint1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISoftLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Soft Light Blend Mode";
     CIAttributeFilterName = CISoftLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceAtopCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Atop";
     CIAttributeFilterName = CISourceAtopCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceInCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source In";
     CIAttributeFilterName = CISourceInCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOutCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Out";
     CIAttributeFilterName = CISourceOutCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOverCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Over";
     CIAttributeFilterName = CISourceOverCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISRGBToneCurveToLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "sRGB Tone Curve to Linear";
     CIAttributeFilterName = CISRGBToneCurveToLinear;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStarShineGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Star Shine";
     CIAttributeFilterName = CIStarShineGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.8 0.6 1)";
     };
     inputCrossAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.6";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCrossOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "-2";
     CIAttributeMin = "-8";
     CIAttributeSliderMax = 0;
     CIAttributeSliderMin = "-8";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputCrossScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 15;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputCrossWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.5";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "0.5";
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputEpsilon =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "-2";
     CIAttributeMin = "-8";
     CIAttributeSliderMax = 0;
     CIAttributeSliderMin = "-8";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 50;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 300;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor,
     inputRadius,
     inputCrossScale,
     inputCrossAngle,
     inputCrossOpacity,
     inputCrossWidth,
     inputEpsilon
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStraightenFilter =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Straighten;
     CIAttributeFilterName = CIStraightenFilter;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStripesGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Stripes;
     CIAttributeFilterName = CIStripesGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 80;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISubtractBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Subtract Blend Mode";
     CIAttributeFilterName = CISubtractBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISwipeTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Swipe;
     CIAttributeFilterName = CISwipeTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = "0.1";
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = "0.1";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputExtent,
     inputColor,
     inputTime,
     inputAngle,
     inputWidth,
     inputOpacity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITemperatureAndTint =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Temperature and Tint";
     CIAttributeFilterName = CITemperatureAndTint;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputTargetNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputNeutral,
     inputTargetNeutral
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Tone Curve";
     CIAttributeFilterName = CIToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.25 0.25]";
     CIAttributeIdentity = "[0.25 0.25]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint2 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.5 0.5]";
     CIAttributeIdentity = "[0.5 0.5]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint3 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.75 0.75]";
     CIAttributeIdentity = "[0.75 0.75]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint4 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1]";
     CIAttributeIdentity = "[1 1]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint0,
     inputPoint1,
     inputPoint2,
     inputPoint3,
     inputPoint4
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITriangleKaleidoscope =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Triangle Kaleidoscope";
     CIAttributeFilterName = CITriangleKaleidoscope;
     inputDecay =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.85";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputRotation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "5.924285296593801";
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputSize =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 700;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint,
     inputSize,
     inputRotation,
     inputDecay
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITwelvefoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Twelvefold Reflected Tile";
     CIAttributeFilterName = CITwelvefoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITwirlDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Twirl Distortion";
     CIAttributeFilterName = CITwirlDistortion;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "3.141592653589793";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "12.56637061435917";
     CIAttributeSliderMin = "-12.56637061435917";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIUnsharpMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategorySharpen,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Unsharp Mask";
     CIAttributeFilterName = CIUnsharpMask;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVibrance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vibrance;
     CIAttributeFilterName = CIVibrance;
     inputAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignette =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vignette;
     CIAttributeFilterName = CIVignette;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 2;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignetteEffect =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vignette Effect";
     CIAttributeFilterName = CIVignetteEffect;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputFalloff =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputIntensity,
     inputFalloff
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVortexDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vortex Distortion";
     CIAttributeFilterName = CIVortexDistortion;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "56.54866776461628";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "94.24777960769379";
     CIAttributeSliderMin = "-94.24777960769379";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIWhitePointAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "White Point Adjust";
     CIAttributeFilterName = CIWhitePointAdjust;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeIdentity = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryStylize =     (
     {
     CIBlendWithAlphaMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Blend With Alpha Mask";
     CIAttributeFilterName = CIBlendWithAlphaMask;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage,
     inputMaskImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBlendWithMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Blend With Mask";
     CIAttributeFilterName = CIBlendWithMask;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage,
     inputMaskImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBloom =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Bloom;
     CIAttributeFilterName = CIBloom;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution3X3 =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "3X3 Convolution";
     CIAttributeFilterName = CIConvolution3X3;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution5X5 =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "5X5 Convolution";
     CIAttributeFilterName = CIConvolution5X5;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution9Horizontal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Horizontal 9 Convolution";
     CIAttributeFilterName = CIConvolution9Horizontal;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution9Vertical =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vertical 9 Convolution";
     CIAttributeFilterName = CIConvolution9Vertical;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGloom =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Gloom;
     CIAttributeFilterName = CIGloom;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHighlightShadowAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Highlights and Shadows";
     CIAttributeFilterName = CIHighlightShadowAdjust;
     inputHighlightAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "0.3";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputShadowAmount,
     inputHighlightAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPixellate =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Pixelate;
     CIAttributeFilterName = CIPixellate;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 8;
     CIAttributeIdentity = 1;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryTileEffect =     (
     {
     CIAffineClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Clamp";
     CIAttributeFilterName = CIAffineClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Tile";
     CIAttributeFilterName = CIAffineTile;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIEightfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Eightfold Reflected Tile";
     CIAttributeFilterName = CIEightfoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Reflected Tile";
     CIAttributeFilterName = CIFourfoldReflectedTile;
     inputAcuteAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.570796326794897";
     CIAttributeIdentity = "1.570796326794897";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputAcuteAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldRotatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Rotated Tile";
     CIAttributeFilterName = CIFourfoldRotatedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldTranslatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Translated Tile";
     CIAttributeFilterName = CIFourfoldTranslatedTile;
     inputAcuteAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.570796326794897";
     CIAttributeIdentity = "1.570796326794897";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputAcuteAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGlideReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Glide Reflected Tile";
     CIAttributeFilterName = CIGlideReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISixfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sixfold Reflected Tile";
     CIAttributeFilterName = CISixfoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISixfoldRotatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sixfold Rotated Tile";
     CIAttributeFilterName = CISixfoldRotatedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITriangleKaleidoscope =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Triangle Kaleidoscope";
     CIAttributeFilterName = CITriangleKaleidoscope;
     inputDecay =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.85";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputRotation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "5.924285296593801";
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputSize =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 700;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint,
     inputSize,
     inputRotation,
     inputDecay
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITwelvefoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Twelvefold Reflected Tile";
     CIAttributeFilterName = CITwelvefoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryTransition =     (
     {
     CIAccordionFoldTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Accordion Fold Transition";
     CIAttributeFilterName = CIAccordionFoldTransition;
     inputBottomHeight =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputFoldShadowAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.1";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNumberOfFolds =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 3;
     CIAttributeMax = 50;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputBottomHeight,
     inputNumberOfFolds,
     inputFoldShadowAmount,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBarsSwipeTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bars Swipe Transition";
     CIAttributeFilterName = CIBarsSwipeTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "3.141592653589793";
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputBarOffset =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 30;
     CIAttributeMin = 2;
     CIAttributeSliderMax = 300;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputAngle,
     inputWidth,
     inputBarOffset,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICopyMachineTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Copy Machine";
     CIAttributeFilterName = CICopyMachineTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 1 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.3";
     CIAttributeIdentity = "1.3";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 3;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 200;
     CIAttributeIdentity = 200;
     CIAttributeMin = "0.1";
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = "0.1";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputExtent,
     inputColor,
     inputTime,
     inputAngle,
     inputWidth,
     inputOpacity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDisintegrateWithMaskTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Disintegrate With Mask";
     CIAttributeFilterName = CIDisintegrateWithMaskTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputShadowDensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.65";
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowOffset =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 -10]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputShadowRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 8;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputMaskImage,
     inputTime,
     inputShadowRadius,
     inputShadowDensity,
     inputShadowOffset
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDissolveTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Dissolve;
     CIAttributeFilterName = CIDissolveTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFlashTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Flash;
     CIAttributeFilterName = CIFlashTransition;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.8 0.6 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputFadeThreshold =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.85";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxStriationRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.58";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputStriationContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.375";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 5;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputStriationStrength =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 3;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputCenter,
     inputExtent,
     inputColor,
     inputTime,
     inputMaxStriationRadius,
     inputStriationStrength,
     inputStriationContrast,
     inputFadeThreshold
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIModTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Mod;
     CIAttributeFilterName = CIModTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = "-6.283185307179586";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputCompression =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 100;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputCenter,
     inputTime,
     inputAngle,
     inputRadius,
     inputCompression
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISwipeTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Swipe;
     CIAttributeFilterName = CISwipeTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = "0.1";
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = "0.1";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputExtent,
     inputColor,
     inputTime,
     inputAngle,
     inputWidth,
     inputOpacity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     CICategoryVideo =     (
     {
     CIAccordionFoldTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Accordion Fold Transition";
     CIAttributeFilterName = CIAccordionFoldTransition;
     inputBottomHeight =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputFoldShadowAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.1";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNumberOfFolds =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 3;
     CIAttributeMax = 50;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputBottomHeight,
     inputNumberOfFolds,
     inputFoldShadowAmount,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAdditionCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Addition;
     CIAttributeFilterName = CIAdditionCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Clamp";
     CIAttributeFilterName = CIAffineClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Tile";
     CIAttributeFilterName = CIAffineTile;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAffineTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Affine Transform";
     CIAttributeFilterName = CIAffineTransform;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTransform =                     {
     CIAttributeClass = NSValue;
     CIAttributeDefault = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeIdentity = "CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}";
     CIAttributeType = CIAttributeTypeTransform;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTransform
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIAreaHistogram =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryReduction,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Area Histogram";
     CIAttributeFilterName = CIAreaHistogram;
     inputCount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 64;
     CIAttributeMax = 256;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 256;
     CIAttributeSliderMin = 10;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputExtent,
     inputScale,
     inputCount
     );
     "filter outputKeys" =                 (
     outputImage,
     outputData
     );
     };
     },
     {
     CIAztecCodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Aztec Code Generator";
     CIAttributeFilterName = CIAztecCodeGenerator;
     inputCompactStyle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     };
     inputCorrectionLevel =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 23;
     CIAttributeMax = 95;
     CIAttributeMin = 5;
     CIAttributeSliderMax = 95;
     CIAttributeSliderMin = 5;
     };
     inputLayers =                     {
     CIAttributeClass = NSNumber;
     CIAttributeMax = 32;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 32;
     CIAttributeSliderMin = 1;
     };
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputCorrectionLevel,
     inputLayers,
     inputCompactStyle
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIBarsSwipeTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bars Swipe Transition";
     CIAttributeFilterName = CIBarsSwipeTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "3.141592653589793";
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputBarOffset =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 30;
     CIAttributeMin = 2;
     CIAttributeSliderMax = 300;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputAngle,
     inputWidth,
     inputBarOffset,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBlendWithAlphaMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Blend With Alpha Mask";
     CIAttributeFilterName = CIBlendWithAlphaMask;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage,
     inputMaskImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBlendWithMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Blend With Mask";
     CIAttributeFilterName = CIBlendWithMask;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage,
     inputMaskImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBloom =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Bloom;
     CIAttributeFilterName = CIBloom;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBumpDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bump Distortion";
     CIAttributeFilterName = CIBumpDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 600;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIBumpDistortionLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Bump Distortion Linear";
     CIAttributeFilterName = CIBumpDistortionLinear;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 600;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICheckerboardGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Checkerboard;
     CIAttributeFilterName = CICheckerboardGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 80;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICircleSplashDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Circle Splash Distortion";
     CIAttributeFilterName = CICircleSplashDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICircularScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Circular Screen";
     CIAttributeFilterName = CICircularScreen;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICode128BarcodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Code128 Barcode Generator";
     CIAttributeFilterName = CICode128BarcodeGenerator;
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     inputQuietSpace =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 7;
     CIAttributeMax = 20;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 20;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputQuietSpace
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIColorBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Blend Mode";
     CIAttributeFilterName = CIColorBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Burn Blend Mode";
     CIAttributeFilterName = CIColorBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorClamp =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Clamp";
     CIAttributeFilterName = CIColorClamp;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1 1 1]";
     };
     inputMinComponents =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputMinComponents,
     inputMaxComponents
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorControls =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Controls";
     CIAttributeFilterName = CIColorControls;
     inputBrightness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSaturation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSaturation,
     inputBrightness,
     inputContrast
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCrossPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cross Polynomial";
     CIAttributeFilterName = CIColorCrossPolynomial;
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 1 0 0 0 0 0 0 0]";
     };
     inputCoefficients =                     {
     CIAttributeClass = CIVector;
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 1 0 0 0 0 0 0 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCoefficients,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCube =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube";
     CIAttributeFilterName = CIColorCube;
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorCubeWithColorSpace =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Cube with ColorSpace";
     CIAttributeFilterName = CIColorCubeWithColorSpace;
     inputColorSpace =                     {
     CIAttributeClass = NSObject;
     };
     inputCubeData =                     {
     CIAttributeClass = NSData;
     CIAttributeDefault = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     CIAttributeIdentity = <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>;
     };
     inputCubeDimension =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeIdentity = 2;
     CIAttributeMax = 64;
     CIAttributeMin = 2;
     CIAttributeType = CIAttributeTypeCount;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCubeDimension,
     inputCubeData,
     inputColorSpace
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Dodge Blend Mode";
     CIAttributeFilterName = CIColorDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorInvert =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Invert";
     CIAttributeFilterName = CIColorInvert;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMap =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Map";
     CIAttributeFilterName = CIColorMap;
     inputGradientImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputGradientImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMatrix =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Matrix";
     CIAttributeFilterName = CIColorMatrix;
     inputAVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 1]";
     CIAttributeIdentity = "[0 0 0 1]";
     };
     inputBVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 1 0]";
     CIAttributeIdentity = "[0 0 1 0]";
     };
     inputBiasVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0]";
     };
     inputGVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRVector =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 0 0 0]";
     CIAttributeIdentity = "[1 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRVector,
     inputGVector,
     inputBVector,
     inputAVector,
     inputBiasVector
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorMonochrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Monochrome";
     CIAttributeFilterName = CIColorMonochrome;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 0.45 0.3 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPolynomial =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Polynomial";
     CIAttributeFilterName = CIColorPolynomial;
     inputAlphaCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputBlueCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputGreenCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRedCoefficients =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 1 0 0]";
     CIAttributeIdentity = "[0 1 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRedCoefficients,
     inputGreenCoefficients,
     inputBlueCoefficients,
     inputAlphaCoefficients
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIColorPosterize =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Color Posterize";
     CIAttributeFilterName = CIColorPosterize;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLevels =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeIdentity = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 30;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputLevels
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConstantColorGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Constant Color";
     CIAttributeFilterName = CIConstantColorGenerator;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     };
     "filter inputKeys" =                 (
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution3X3 =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "3X3 Convolution";
     CIAttributeFilterName = CIConvolution3X3;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution5X5 =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "5X5 Convolution";
     CIAttributeFilterName = CIConvolution5X5;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution9Horizontal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Horizontal 9 Convolution";
     CIAttributeFilterName = CIConvolution9Horizontal;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIConvolution9Vertical =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vertical 9 Convolution";
     CIAttributeFilterName = CIConvolution9Vertical;
     inputBias =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWeights =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 0 0 1 0 0 0 0]";
     CIAttributeIdentity = "[0 0 0 0 1 0 0 0 0]";
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputWeights,
     inputBias
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICopyMachineTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Copy Machine";
     CIAttributeFilterName = CICopyMachineTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.6 1 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.3";
     CIAttributeIdentity = "1.3";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 3;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 200;
     CIAttributeIdentity = 200;
     CIAttributeMin = "0.1";
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = "0.1";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputExtent,
     inputColor,
     inputTime,
     inputAngle,
     inputWidth,
     inputOpacity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CICrop =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Crop;
     CIAttributeFilterName = CICrop;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRectangle =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]";
     CIAttributeIdentity = "[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRectangle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDarkenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Darken Blend Mode";
     CIAttributeFilterName = CIDarkenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDifferenceBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Difference Blend Mode";
     CIAttributeFilterName = CIDifferenceBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDisintegrateWithMaskTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Disintegrate With Mask";
     CIAttributeFilterName = CIDisintegrateWithMaskTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaskImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputShadowDensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.65";
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowOffset =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 -10]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputShadowRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 8;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputMaskImage,
     inputTime,
     inputShadowRadius,
     inputShadowDensity,
     inputShadowOffset
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDissolveTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Dissolve;
     CIAttributeFilterName = CIDissolveTransition;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputTime
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDivideBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Divide Blend Mode";
     CIAttributeFilterName = CIDivideBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIDotScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Dot Screen";
     CIAttributeFilterName = CIDotScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIEightfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Eightfold Reflected Tile";
     CIAttributeFilterName = CIEightfoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExclusionBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Exclusion Blend Mode";
     CIAttributeFilterName = CIExclusionBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIExposureAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Exposure Adjust";
     CIAttributeFilterName = CIExposureAdjust;
     inputEV =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "-10";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputEV
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFalseColor =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "False Color";
     CIAttributeFilterName = CIFalseColor;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0.3 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.9 0.8 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFlashTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Flash;
     CIAttributeFilterName = CIFlashTransition;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.8 0.6 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputFadeThreshold =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.85";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputMaxStriationRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.58";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputStriationContrast =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.375";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 5;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputStriationStrength =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 3;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputCenter,
     inputExtent,
     inputColor,
     inputTime,
     inputMaxStriationRadius,
     inputStriationStrength,
     inputStriationContrast,
     inputFadeThreshold
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Reflected Tile";
     CIAttributeFilterName = CIFourfoldReflectedTile;
     inputAcuteAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.570796326794897";
     CIAttributeIdentity = "1.570796326794897";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputAcuteAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldRotatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Rotated Tile";
     CIAttributeFilterName = CIFourfoldRotatedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIFourfoldTranslatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Fourfold Translated Tile";
     CIAttributeFilterName = CIFourfoldTranslatedTile;
     inputAcuteAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "1.570796326794897";
     CIAttributeIdentity = "1.570796326794897";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputAcuteAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGammaAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gamma Adjust";
     CIAttributeFilterName = CIGammaAdjust;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPower =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 4;
     CIAttributeSliderMin = "0.25";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPower
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGaussianBlur =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryBlur,
     CICategoryStillImage,
     CICategoryVideo,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gaussian Blur";
     CIAttributeFilterName = CIGaussianBlur;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGaussianGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Gaussian Gradient";
     CIAttributeFilterName = CIGaussianGradient;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 0)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGlassDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Glass Distortion";
     CIAttributeFilterName = CIGlassDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 200;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = "0.01";
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTexture =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTexture,
     inputCenter,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGlideReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Glide Reflected Tile";
     CIAttributeFilterName = CIGlideReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIGloom =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Gloom;
     CIAttributeFilterName = CIGloom;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 10;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHardLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hard Light Blend Mode";
     CIAttributeFilterName = CIHardLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHatchedScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hatched Screen";
     CIAttributeFilterName = CIHatchedScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHighlightShadowAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Highlights and Shadows";
     CIAttributeFilterName = CIHighlightShadowAdjust;
     inputHighlightAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "0.3";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputShadowAmount,
     inputHighlightAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHistogramDisplayFilter =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryReduction,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Histogram Display";
     CIAttributeFilterName = CIHistogramDisplayFilter;
     inputHeight =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 200;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputHighLimit =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputLowLimit =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputHeight,
     inputHighLimit,
     inputLowLimit
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHoleDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hole Distortion";
     CIAttributeFilterName = CIHoleDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeIdentity = "0.1";
     CIAttributeMin = "0.01";
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = "0.01";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Adjust";
     CIAttributeFilterName = CIHueAdjust;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIHueBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Hue Blend Mode";
     CIAttributeFilterName = CIHueBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILanczosScaleTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lanczos Scale Transform";
     CIAttributeFilterName = CILanczosScaleTransform;
     inputAspectRatio =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "2.5";
     CIAttributeSliderMin = "0.05";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = "1.5";
     CIAttributeSliderMin = "0.05";
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputScale,
     inputAspectRatio
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Lighten Blend Mode";
     CIAttributeFilterName = CILightenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILightTunnel =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Light Tunnel";
     CIAttributeFilterName = CILightTunnel;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputRotation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "1.570796326794897";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRotation,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearBurnBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Burn Blend Mode";
     CIAttributeFilterName = CILinearBurnBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearDodgeBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Dodge Blend Mode";
     CIAttributeFilterName = CILinearDodgeBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear Gradient";
     CIAttributeFilterName = CILinearGradient;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[200 200]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputPoint0,
     inputPoint1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILinearToSRGBToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Linear to sRGB Tone Curve";
     CIAttributeFilterName = CILinearToSRGBToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILineScreen =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryHalftoneEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Line Screen";
     CIAttributeFilterName = CILineScreen;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.7";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 6;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 50;
     CIAttributeSliderMin = 2;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CILuminosityBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Luminosity Blend Mode";
     CIAttributeFilterName = CILuminosityBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaskToAlpha =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Mask to Alpha";
     CIAttributeFilterName = CIMaskToAlpha;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Maximum Component";
     CIAttributeFilterName = CIMaximumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMaximumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Maximum;
     CIAttributeFilterName = CIMaximumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumComponent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Minimum Component";
     CIAttributeFilterName = CIMinimumComponent;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMinimumCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Minimum;
     CIAttributeFilterName = CIMinimumCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIModTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Mod;
     CIAttributeFilterName = CIModTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 2;
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = "-6.283185307179586";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputCompression =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 100;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputCenter,
     inputTime,
     inputAngle,
     inputRadius,
     inputCompression
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Multiply Blend Mode";
     CIAttributeFilterName = CIMultiplyBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIMultiplyCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Multiply;
     CIAttributeFilterName = CIMultiplyCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIOverlayBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Overlay Blend Mode";
     CIAttributeFilterName = CIOverlayBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Tile";
     CIAttributeFilterName = CIPerspectiveTile;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTransform =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Transform";
     CIAttributeFilterName = CIPerspectiveTransform;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPerspectiveTransformWithExtent =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage
     );
     CIAttributeFilterDisplayName = "Perspective Transform with Extent";
     CIAttributeFilterName = CIPerspectiveTransformWithExtent;
     inputBottomLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[155 153]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputBottomRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[548 140]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTopLeft =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[118 484]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputTopRight =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[646 507]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputExtent,
     inputTopLeft,
     inputTopRight,
     inputBottomRight,
     inputBottomLeft
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectChrome =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Chrome";
     CIAttributeFilterName = CIPhotoEffectChrome;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectFade =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Fade";
     CIAttributeFilterName = CIPhotoEffectFade;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectInstant =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Instant";
     CIAttributeFilterName = CIPhotoEffectInstant;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectMono =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Mono";
     CIAttributeFilterName = CIPhotoEffectMono;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectNoir =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Noir";
     CIAttributeFilterName = CIPhotoEffectNoir;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectProcess =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Process";
     CIAttributeFilterName = CIPhotoEffectProcess;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTonal =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Tonal";
     CIAttributeFilterName = CIPhotoEffectTonal;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPhotoEffectTransfer =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Photo Effect Transfer";
     CIAttributeFilterName = CIPhotoEffectTransfer;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinchDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pinch Distortion";
     CIAttributeFilterName = CIPinchDistortion;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPinLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Pin Light Mode";
     CIAttributeFilterName = CIPinLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIPixellate =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryStylize,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Pixelate;
     CIAttributeFilterName = CIPixellate;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 8;
     CIAttributeIdentity = 1;
     CIAttributeMin = 1;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputScale
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIQRCodeGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "QRCode Generator";
     CIAttributeFilterName = CIQRCodeGenerator;
     inputCorrectionLevel =                     {
     CIAttributeClass = NSString;
     CIAttributeDefault = M;
     };
     inputMessage =                     {
     CIAttributeClass = NSData;
     };
     };
     "filter inputKeys" =                 (
     inputMessage,
     inputCorrectionLevel
     );
     "filter outputKeys" =                 (
     outputImage,
     outputCGImage
     );
     };
     },
     {
     CIRadialGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Radial Gradient";
     CIAttributeFilterName = CIRadialGradient;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputRadius0 =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 5;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputRadius1 =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputRadius0,
     inputRadius1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIRandomGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Random Generator";
     CIAttributeFilterName = CIRandomGenerator;
     };
     "filter inputKeys" =                 (
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISaturationBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Saturation Blend Mode";
     CIAttributeFilterName = CISaturationBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIScreenBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Screen Blend Mode";
     CIAttributeFilterName = CIScreenBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISepiaTone =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryStillImage,
     CICategoryBuiltIn,
     CICategoryXMPSerializable
     );
     CIAttributeFilterDisplayName = "Sepia Tone";
     CIAttributeFilterName = CISepiaTone;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISharpenLuminance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategorySharpen,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sharpen Luminance";
     CIAttributeFilterName = CISharpenLuminance;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.4";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISixfoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sixfold Reflected Tile";
     CIAttributeFilterName = CISixfoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISixfoldRotatedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Sixfold Rotated Tile";
     CIAttributeFilterName = CISixfoldRotatedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISmoothLinearGradient =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGradient,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Smooth Linear Gradient";
     CIAttributeFilterName = CISmoothLinearGradient;
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[200 200]";
     CIAttributeType = CIAttributeTypePosition;
     };
     };
     "filter inputKeys" =                 (
     inputPoint0,
     inputPoint1,
     inputColor0,
     inputColor1
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISoftLightBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Soft Light Blend Mode";
     CIAttributeFilterName = CISoftLightBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceAtopCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Atop";
     CIAttributeFilterName = CISourceAtopCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceInCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source In";
     CIAttributeFilterName = CISourceInCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOutCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Out";
     CIAttributeFilterName = CISourceOutCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISourceOverCompositing =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryHighDynamicRange,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Source Over";
     CIAttributeFilterName = CISourceOverCompositing;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISRGBToneCurveToLinear =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "sRGB Tone Curve to Linear";
     CIAttributeFilterName = CISRGBToneCurveToLinear;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStarShineGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Star Shine";
     CIAttributeFilterName = CIStarShineGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 0.8 0.6 1)";
     };
     inputCrossAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.6";
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCrossOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "-2";
     CIAttributeMin = "-8";
     CIAttributeSliderMax = 0;
     CIAttributeSliderMin = "-8";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputCrossScale =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 15;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputCrossWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.5";
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = "0.5";
     CIAttributeType = CIAttributeTypeDistance;
     };
     inputEpsilon =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "-2";
     CIAttributeMin = "-8";
     CIAttributeSliderMax = 0;
     CIAttributeSliderMin = "-8";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 50;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 300;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor,
     inputRadius,
     inputCrossScale,
     inputCrossAngle,
     inputCrossOpacity,
     inputCrossWidth,
     inputEpsilon
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStraightenFilter =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGeometryAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Straighten;
     CIAttributeFilterName = CIStraightenFilter;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIStripesGenerator =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryGenerator,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Stripes;
     CIAttributeFilterName = CIStripesGenerator;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputColor0 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     };
     inputColor1 =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(0 0 0 1)";
     };
     inputSharpness =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 80;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputCenter,
     inputColor0,
     inputColor1,
     inputWidth,
     inputSharpness
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISubtractBlendMode =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryCompositeOperation,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Subtract Blend Mode";
     CIAttributeFilterName = CISubtractBlendMode;
     inputBackgroundImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputBackgroundImage
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CISwipeTransition =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTransition,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Swipe;
     CIAttributeFilterName = CISwipeTransition;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputExtent =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0 300 300]";
     CIAttributeType = CIAttributeTypeRectangle;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputOpacity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputTargetImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputTime =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeTime;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeMin = "0.1";
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = "0.1";
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputTargetImage,
     inputExtent,
     inputColor,
     inputTime,
     inputAngle,
     inputWidth,
     inputOpacity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITemperatureAndTint =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Temperature and Tint";
     CIAttributeFilterName = CITemperatureAndTint;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputTargetNeutral =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[6500 0]";
     CIAttributeIdentity = "[6500 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputNeutral,
     inputTargetNeutral
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIToneCurve =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Tone Curve";
     CIAttributeFilterName = CIToneCurve;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint0 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0 0]";
     CIAttributeIdentity = "[0 0]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint1 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.25 0.25]";
     CIAttributeIdentity = "[0.25 0.25]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint2 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.5 0.5]";
     CIAttributeIdentity = "[0.5 0.5]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint3 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[0.75 0.75]";
     CIAttributeIdentity = "[0.75 0.75]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     inputPoint4 =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[1 1]";
     CIAttributeIdentity = "[1 1]";
     CIAttributeType = CIAttributeTypeOffset;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint0,
     inputPoint1,
     inputPoint2,
     inputPoint3,
     inputPoint4
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITriangleKaleidoscope =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Triangle Kaleidoscope";
     CIAttributeFilterName = CITriangleKaleidoscope;
     inputDecay =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.85";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputPoint =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputRotation =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "5.924285296593801";
     CIAttributeSliderMax = "6.283185307179586";
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputSize =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 700;
     CIAttributeSliderMax = 1000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputPoint,
     inputSize,
     inputRotation,
     inputDecay
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITwelvefoldReflectedTile =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryTileEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Twelvefold Reflected Tile";
     CIAttributeFilterName = CITwelvefoldReflectedTile;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "3.141592653589793";
     CIAttributeSliderMin = "-3.141592653589793";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputWidth =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 100;
     CIAttributeIdentity = 100;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 200;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputAngle,
     inputWidth
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CITwirlDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Twirl Distortion";
     CIAttributeFilterName = CITwirlDistortion;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "3.141592653589793";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "12.56637061435917";
     CIAttributeSliderMin = "-12.56637061435917";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 300;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 500;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIUnsharpMask =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategorySharpen,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Unsharp Mask";
     CIAttributeFilterName = CIUnsharpMask;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "2.5";
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 100;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputRadius,
     inputIntensity
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVibrance =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vibrance;
     CIAttributeFilterName = CIVibrance;
     inputAmount =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputAmount
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignette =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = Vignette;
     CIAttributeFilterName = CIVignette;
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeMax = 2;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputIntensity,
     inputRadius
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVignetteEffect =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorEffect,
     CICategoryVideo,
     CICategoryInterlaced,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vignette Effect";
     CIAttributeFilterName = CIVignetteEffect;
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputFalloff =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "0.5";
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputIntensity =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 150;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 2000;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputIntensity,
     inputFalloff
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIVortexDistortion =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryDistortionEffect,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "Vortex Distortion";
     CIAttributeFilterName = CIVortexDistortion;
     inputAngle =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = "56.54866776461628";
     CIAttributeIdentity = 0;
     CIAttributeSliderMax = "94.24777960769379";
     CIAttributeSliderMin = "-94.24777960769379";
     CIAttributeType = CIAttributeTypeAngle;
     };
     inputCenter =                     {
     CIAttributeClass = CIVector;
     CIAttributeDefault = "[150 150]";
     CIAttributeType = CIAttributeTypePosition;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =                     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 300;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 800;
     CIAttributeSliderMin = 0;
     CIAttributeType = CIAttributeTypeDistance;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputCenter,
     inputRadius,
     inputAngle
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     },
     {
     CIWhitePointAdjust =             {
     "filter attributes" =                 {
     CIAttributeFilterCategories =                     (
     CICategoryColorAdjustment,
     CICategoryVideo,
     CICategoryStillImage,
     CICategoryInterlaced,
     CICategoryNonSquarePixels,
     CICategoryBuiltIn
     );
     CIAttributeFilterDisplayName = "White Point Adjust";
     CIAttributeFilterName = CIWhitePointAdjust;
     inputColor =                     {
     CIAttributeClass = CIColor;
     CIAttributeDefault = "(1 1 1 1)";
     CIAttributeIdentity = "(1 1 1 1)";
     CIAttributeType = CIAttributeTypeColor;
     };
     inputImage =                     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     };
     "filter inputKeys" =                 (
     inputImage,
     inputColor
     );
     "filter outputKeys" =                 (
     outputImage
     );
     };
     }
     );
     }
     
     (lldb)
     
     */
    
    
}

@end
