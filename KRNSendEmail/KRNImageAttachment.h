//
//  KRNImageAttachment.h
//  KRNShareEmailExample
//
//  Created by ulian_onua on 3/15/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "KRNEmailAttachment.h"
@import UIKit;

// get email attachment from UIImage
@interface KRNImageAttachment : KRNEmailAttachment
+ (instancetype)pngAttachmentWithImage:(UIImage *)image andName:(NSString *)name;
+ (instancetype)jpegAttachmentWithImage:(UIImage *)image andName:(NSString *)name;
@end
