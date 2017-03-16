//
//  KRNImageAttachment.m
//  KRNShareEmailExample
//
//  Created by ulian_onua on 3/15/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "KRNImageAttachment.h"

typedef enum : NSUInteger {
    KRNImageAttachmentJPEG,
    KRNImageAttachmentPNG
} KRNImageAttachmentType;

@implementation KRNImageAttachment

+ (instancetype)pngAttachmentWithImage:(UIImage *)image andName:(NSString *)name; {
    return [self attachmentWithImage:image ofType:KRNImageAttachmentPNG andName:name];
}

+ (instancetype)jpegAttachmentWithImage:(UIImage *)image andName:(NSString *)name {
    return [self attachmentWithImage:image ofType:KRNImageAttachmentJPEG andName:name];
}

+ (instancetype)attachmentWithImage:(UIImage *)image ofType:(KRNImageAttachmentType)type andName:(NSString *)name {
    if (!image) return nil;
    NSData *data = (type == KRNImageAttachmentPNG) ?  UIImagePNGRepresentation(image) : UIImageJPEGRepresentation(image, 1.0f);
    NSString *mimeType = (type == KRNImageAttachmentPNG) ? @"image/png" : @"image/jpeg";
    return [self attachmentWithData:data mimeType:mimeType andFileName:name];
}

@end
