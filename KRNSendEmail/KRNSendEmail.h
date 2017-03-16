//
//  KRNSendEmail.h

//  Created by ulian_onua on 2/23/17.
//
//

@import Foundation;
@import UIKit;
#import "KRNEmailAttachment.h"

typedef enum : NSUInteger {
    KRNSendEmailResultSent,
    KRNSendEmailResultCancelled,
    KRNSendEmailResultSaved,
    KRNSendEmailResultFailed
} KRNSendEmailResult;

@interface KRNSendEmail : NSObject

+ (BOOL)canSend; // check if current device can send email

+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipient:(NSString *)recipient withSubject:(NSString *)subject withMessage:(NSString *)message withCompletion:(void(^)(KRNSendEmailResult result, NSError *error)) completion; // send email to one recipient

+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipients:(NSArray<NSString *>*)recipients withSubject:(NSString *)subject withMessage:(NSString *)message withCompletion:(void(^)(KRNSendEmailResult result, NSError *error)) completion; // send email to one ore many recipients

+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipients:(NSArray<NSString *>*)recipients withSubject:(NSString *)subject withMessage:(NSString *)message withAttachments:(NSArray<KRNEmailAttachment *> *)attachments withCompletion:(void(^)(KRNSendEmailResult result, NSError *error))completion; // send email to one or many recipients with one or many attachments

+ (NSString *)sendEmailResultStringRepresentation:(KRNSendEmailResult)result; // get quick string representation of KRNSendEmailResult

@end
