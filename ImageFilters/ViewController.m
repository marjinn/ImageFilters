//
//  ViewController.m
//  ImageFilters
//
//  Created by mar Jinn on 10/11/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "ViewController.h"
#import "CITipsAndTryOuts.h"

#import <ImageIO/ImageIO.h>

@import AssetsLibrary;
@import Photos;

@interface ViewController ()

@end

@implementation ViewController

-(void)saveAnImageToPhone:(CIImage*) image
{
    __block PHAssetChangeRequest* createAssetRequest = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:
     ^{
         createAssetRequest =
         [PHAssetChangeRequest creationRequestForAssetFromImage:[UIImage imageWithCIImage:image]];
         
         PHFetchResult* albumFetch = nil;
         albumFetch =
         [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil] ;
         
         NSArray* arrayOfAlbums = nil;
         arrayOfAlbums =
         [(PHFetchResult*)albumFetch objectsAtIndexes:
          (NSIndexSet *)[NSIndexSet indexSetWithIndexesInRange:
                         (NSRange)
                         (( NSRange (*) (NSUInteger,NSUInteger))NSMakeRange)(0, [albumFetch count])]];
         
         NSMutableDictionary* dictOfAlbumTypes = nil;
         dictOfAlbumTypes = [[NSMutableDictionary alloc] initWithCapacity:[arrayOfAlbums count]];
         
         /* can do this with PHFetchResult as well */
         for (PHAssetCollection* assetCollection in arrayOfAlbums)
         {
             switch ([assetCollection assetCollectionSubtype])
             {
                     
                 case PHAssetCollectionSubtypeAlbumRegular:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumRegular"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeAlbumSyncedEvent:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumSyncedEvent"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeAlbumSyncedFaces:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumSyncedFaces"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeAlbumSyncedAlbum:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumSyncedAlbum"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeAlbumImported:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumImported"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeAlbumCloudShared:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumCloudShared"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumGeneric:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumGeneric"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumPanoramas:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumPanoramas"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumVideos:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumVideos"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumFavorites:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumFavorites"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumTimelapses:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumTimelapses"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumAllHidden:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumAllHidden"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumRecentlyAdded:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumRecentlyAdded"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumBursts:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumBursts"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeSmartAlbumSlomoVideos:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumSlomoVideos"] = assetCollection;
                     break;
                     
                 case PHAssetCollectionSubtypeAny:
                 default:
                     dictOfAlbumTypes[@"PHAssetCollectionSubtypeAny"] = assetCollection;
                     break;
                     
             }
             
             
             NSLog(@"album Sub type -> %ld",(long)[assetCollection assetCollectionSubtype]);
             
             
         }
         
         
         NSLog(@"dictOfAlbumTypes -> %@",dictOfAlbumTypes);
         
        
         PHAssetCollectionChangeRequest* assetCollectionChangeRequest = nil;
         assetCollectionChangeRequest =
         [PHAssetCollectionChangeRequest changeRequestForAssetCollection:
          (PHAssetCollection *)dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumRecentlyAdded"]];
         
         [assetCollectionChangeRequest addAssets:
          (id<NSFastEnumeration>)@[[createAssetRequest placeholderForCreatedAsset]]];
         
     }
                                      completionHandler:
     ^(BOOL success, NSError *error)
    {
        NSLog(@"save error %@" ,error);
    }
     ];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ///cpu context - when saving image to photo roll
    
    //RENDERING CIImage  using CPU
    
    static NSString* const imageName = @"arrow.jpg";
    
    //create CIImage
    NSURL* imageURL = nil;
    imageURL =
    [[[NSBundle mainBundle] resourceURL] URLByAppendingPathComponent:imageName];
    
    //using CIImage imageWIthData or imageWithContentsOFURL
    //gives lot of metatdata informataion
    
    CIImage* ci_image = nil;
    ci_image = [CIImage imageWithContentsOfURL:imageURL];
    
    //create a CIFilter and set input values
    CIFilter* ci_sepiaFilter = nil;
    ci_sepiaFilter = [CIFilter filterWithName:@"CISepiaTone"];
    
    [ci_sepiaFilter setValue:ci_image forKey:kCIInputImageKey];
    [ci_sepiaFilter setValue:[NSNumber numberWithFloat:0.8f]
                      forKey:@"inputIntensity"];

    
    //create CPU Context
    NSDictionary* options = nil;
    options = @{ kCIContextUseSoftwareRenderer : @YES };
    
    CIContext* cpuContext = nil;
    cpuContext =
    [CIContext contextWithOptions:options];
    
    
    //create CGImage from CIImage
    CIImage* outputImage = nil;
    outputImage = [ci_sepiaFilter outputImage];
    
    CGImageRef cgiimg = nil;
    cgiimg =
    [cpuContext createCGImage:outputImage fromRect:[outputImage extent]];
    
//    //Add CGIImage to photo library
//    ALAssetsLibrary* library = nil;
//    library = [ALAssetsLibrary new];
//    
//    [library writeImageToSavedPhotosAlbum:cgiimg
//                                 metadata:[outputImage properties]
//                          completionBlock:
//     ^(NSURL *assetURL, NSError *error)
//    {
//        CGImageRelease(cgiimg);
//    }
//     ];
    
    
    /*
     There is no need for 2 perform changes 
     all changes including creation editing
     can be done in one
     */
    
    [self saveAnImageToPhone:outputImage];
    
    __block PHAssetChangeRequest* createAssetRequest = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:
     ^{
         
         createAssetRequest =
         [PHAssetChangeRequest creationRequestForAssetFromImage:[UIImage imageWithCGImage:cgiimg]];
     }
                                      completionHandler:
     ^(BOOL success, NSError *error)
    {
        
        
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            
            PHFetchResult* albumFetch = nil;
            albumFetch =
            [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil] ;
            
//            PHAssetCollection* assetCollection = nil;
//            assetCollection = (PHAssetCollection*)[albumFetch lastObject];
            
            NSArray* arrayOfAlbums = nil;
            arrayOfAlbums =
            [(PHFetchResult*)albumFetch objectsAtIndexes:
             (NSIndexSet *)[NSIndexSet indexSetWithIndexesInRange:
                            (NSRange)
                            (( NSRange (*) (NSUInteger,NSUInteger))NSMakeRange)(0, [albumFetch count])]];
            
            NSMutableDictionary* dictOfAlbumTypes = nil;
            dictOfAlbumTypes = [[NSMutableDictionary alloc] initWithCapacity:[arrayOfAlbums count]];
            
             for (PHAssetCollection* assetCollection in arrayOfAlbums)
             {
                 switch ([assetCollection assetCollectionSubtype])
                 {
        
                     case PHAssetCollectionSubtypeAlbumRegular:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumRegular"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeAlbumSyncedEvent:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumSyncedEvent"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeAlbumSyncedFaces:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumSyncedFaces"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeAlbumSyncedAlbum:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumSyncedAlbum"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeAlbumImported:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumImported"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeAlbumCloudShared:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeAlbumCloudShared"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumGeneric:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumGeneric"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumPanoramas:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumPanoramas"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumVideos:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumVideos"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumFavorites:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumFavorites"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumTimelapses:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumTimelapses"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumAllHidden:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumAllHidden"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumRecentlyAdded:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumRecentlyAdded"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumBursts:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumBursts"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeSmartAlbumSlomoVideos:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumSlomoVideos"] = assetCollection;
                         break;
                         
                     case PHAssetCollectionSubtypeAny:
                     default:
                         dictOfAlbumTypes[@"PHAssetCollectionSubtypeAny"] = assetCollection;
                         break;
                         
                 }

                
                 NSLog(@"album Sub type -> %ld",(long)[assetCollection assetCollectionSubtype]);
                 
                 
            }
            
           
            NSLog(@"dictOfAlbumTypes -> %@",dictOfAlbumTypes);
            
            
        
            PHAssetCollectionChangeRequest* assetCollectionChangeRequest = nil;
            assetCollectionChangeRequest =
            [PHAssetCollectionChangeRequest changeRequestForAssetCollection:
             (PHAssetCollection *)dictOfAlbumTypes[@"PHAssetCollectionSubtypeSmartAlbumRecentlyAdded"]];
            
            [assetCollectionChangeRequest addAssets:
             (id<NSFastEnumeration>)@[[createAssetRequest placeholderForCreatedAsset]]];
        }
                                          completionHandler:
         ^(BOOL success, NSError *error) {
            
        }];
        
        
        
        
    }
     ];
    
   
}
-(void) applyAnImageToImageView
{
/*Displaying an image in UIIMageView */
UIImageView* imgView = nil;
imgView =
[[UIImageView alloc] initWithFrame:[[self view] bounds]];

[[self view] insertSubview:imgView atIndex:0];
imgView = nil;

NSString* resourcePath = nil;
resourcePath =
[[NSBundle mainBundle] resourcePath];

static NSString* const imageName = @"arrow.jpg";

NSString* imagePath = nil;
imagePath = [resourcePath stringByAppendingPathComponent:imageName];

//    NSData* imageData = nil;
//    imageData =
//    [NSData dataWithContentsOfFile:imagePath];

//input Image
//    UIImage* image = nil;
//    image = [UIImage imageWithData:imageData];

//    CGImageRef cg_image = NULL;
//    cg_image = [image CGImage];

//create CIImage
NSURL* imageURL = nil;
imageURL =
[[[NSBundle mainBundle] resourceURL] URLByAppendingPathComponent:imageName];

//using CIImage imageWIthData or imageWithContentsOFURL
//gives lot of metatdata informataion

CIImage* ci_image = nil;
ci_image = [CIImage imageWithContentsOfURL:imageURL];

//create a CIFilter and set input values
CIFilter* ci_sepiaFilter = nil;
ci_sepiaFilter = [CIFilter filterWithName:@"CISepiaTone"];

[ci_sepiaFilter setValue:ci_image forKey:kCIInputImageKey];
[ci_sepiaFilter setValue:[NSNumber numberWithFloat:0.8f]
                  forKey:@"inputIntensity"];

//create context
CIContext* context = nil;
context = [CIContext contextWithOptions:nil];

//get output from filter
CIImage* outputCIimage = nil;
outputCIimage = [ci_sepiaFilter outputImage];//

//render CIImage into CGImageRef
CGImageRef cgiimg = NULL;
cgiimg =
[context createCGImage:outputCIimage fromRect:[outputCIimage extent]];

//get image orientation
//if no value found the 1 ie UIImageORienttaionUp is assumed
int imageOrientation =
(int)[outputCIimage properties][(__bridge NSString*) kCGImagePropertyTIFFDictionary][(__bridge NSString*)kCGImagePropertyTIFFOrientation];


NSDictionary* tiffDictionary = nil;
tiffDictionary =
[[outputCIimage properties]
 objectForKey:(__bridge NSString*) kCGImagePropertyTIFFDictionary];




UIImage* uiimage = nil;
if (imageOrientation)
{
    //create a UIImage
    
    uiimage =
    [UIImage imageWithCGImage:cgiimg
                        scale:1.0f
                  orientation:(UIImageOrientation)imageOrientation];
    
}
else
{
    //create a UIImage
    uiimage =
    [UIImage imageWithCGImage:cgiimg
                        scale:1.0f
                  orientation:(UIImageOrientation)UIImageOrientationUp];
    
}


[(UIImageView*)[[[self view]subviews] objectAtIndex:0] setImage:uiimage];
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

void imageMetadataFetcher (CIImage* image)
{
    //get
    NSDictionary* tiffDictionary = nil;
    tiffDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyTIFFDictionary];
    
    NSDictionary* gifdDictionary = nil;
    gifdDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyGIFDictionary];
    
    NSDictionary* jfifDictionary = nil;
    jfifDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyJFIFDictionary];
    
    
    NSDictionary* ExifDictionary = nil;
    ExifDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyExifDictionary];
    
    NSDictionary* PNGDictionary = nil;
    PNGDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyPNGDictionary];
    
    
    NSDictionary* IPTCDictionary = nil;
    IPTCDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyIPTCDictionary];
    
    NSDictionary* GPSDictionary = nil;
    GPSDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyGPSDictionary];
    
    NSDictionary* RawDictionary = nil;
    RawDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyRawDictionary];
    
    NSDictionary* CIFFDictionary = nil;
    CIFFDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyCIFFDictionary];
    
    
    /*
     Camera Makers
     */
    NSDictionary* canonDictionary = nil;
    canonDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyMakerCanonDictionary];
    
//    NSDictionary* nikonDictionary = nil;
//    nikonDictionary =
//    [[image properties]
//     objectForKey:(__bridge NSString*) kCGImagePropertyMakerNikonDictionary];
//    
//    NSDictionary* minoltaDictionary = nil;
//    minoltaDictionary =
//    [[image properties]
//     objectForKey:(__bridge NSString*) kCGImagePropertyMakerMinoltaDictionary];
//    
//    NSDictionary* fujiDictionary = nil;
//    fujiDictionary =
//    [[image properties]
//     objectForKey:(__bridge NSString*) kCGImagePropertyMakerFujiDictionary];
//    
//    NSDictionary* olympusDictionary = nil;
//    olympusDictionary =
//    [[image properties]
//     objectForKey:(__bridge NSString*) kCGImagePropertyMakerOlympusDictionary];
//    
//    NSDictionary* pentaxDictionary = nil;
//    pentaxDictionary =
//    [[image properties]
//     objectForKey:(__bridge NSString*) kCGImagePropertyMakerPentaxDictionary];
    
    //others
    
    NSDictionary* BIMDictionary = nil;
    BIMDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImageProperty8BIMDictionary];
    
    NSDictionary* DNGDictionary = nil;
    DNGDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyDNGDictionary];
    
    NSDictionary* ExifAuxDictionary = nil;
    ExifAuxDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyExifAuxDictionary];
    
    //not on iphone
//    NSDictionary* OpenEXRDictionary = nil;
//    pOpenEXRDictionary =
//    [[image properties]
//     objectForKey:(__bridge NSString*) kCGImagePropertyOpenEXRDictionary];
    
    //ios7 and above
    NSDictionary* MakerAppleDictionary = nil;
    MakerAppleDictionary =
    [[image properties]
     objectForKey:(__bridge NSString*) kCGImagePropertyMakerAppleDictionary];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

void getallDataFromCGImage (CGImageRef image)
{
    
    __unused CGImageAlphaInfo alphaInfo =
    CGImageGetAlphaInfo(image);
    
    CGImageGetBitmapInfo(image);
    
    CGImageGetBitsPerComponent(image);
    
    CGImageGetBitsPerPixel(image);
    
    CGImageGetBytesPerRow(image);
    
    CGImageGetColorSpace(image);
    
    CGImageGetDataProvider(image);
    
    CGImageGetDecode(image);
    
    CGImageGetHeight(image);
    
    CGImageGetRenderingIntent(image);
    
    CGImageGetShouldInterpolate(image);
    
    CGImageGetTypeID();
    
    CGImageGetWidth(image);
    
    CGImageIsMask(image);
    
}

@end
