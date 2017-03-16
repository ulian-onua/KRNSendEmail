//
//  KRNEmailAttachment.h
//  KRNShareEmailExample
//
//  Created by ulian_onua on 3/15/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KRNEmailAttachment : NSObject

//use only one of these methods. Calling -(instancetype)init will return nil;
- (instancetype)initWithData:(NSData *)data mimeType:(NSString *)mimeType andFileName:(NSString *)fileName;
+ (instancetype)attachmentWithData:(NSData *)data mimeType:(NSString *)mimeType andFileName:(NSString *)fileName;

@property (strong, nonatomic, readonly) NSData *data;
@property (strong, nonatomic, readonly) NSString *mimeType;
@property (strong, nonatomic, readonly) NSString *filename;

@end
