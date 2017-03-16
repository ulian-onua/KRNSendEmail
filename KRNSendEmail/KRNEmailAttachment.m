//
//  KRNEmailAttachment.m
//  KRNShareEmailExample
//
//  Created by ulian_onua on 3/15/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "KRNEmailAttachment.h"

@implementation KRNEmailAttachment

- (instancetype) init {
    return nil;
}

- (instancetype)initWithData:(NSData *)data mimeType:(NSString *)mimeType andFileName:(NSString *)fileName {
    self = [super init];
    if (self) {
        if (!data || !mimeType) return nil;
        _data = data;
        _mimeType = mimeType;
        _filename = fileName ? : [NSUUID UUID].UUIDString; //use random name if fileName is nil
    }
    return self;
}

+ (instancetype)attachmentWithData:(NSData *)data mimeType:(NSString *)mimeType andFileName:(NSString *)fileName {
    id attachment = [[self alloc]initWithData:data mimeType:mimeType andFileName:fileName];
    return attachment;
}

@end
