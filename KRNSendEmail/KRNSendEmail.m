//
//  KRNSendEmail.h

//  Created by ulian_onua on 2/23/17.
//
//

#import "KRNSendEmail.h"
@import MessageUI;

static __weak UIViewController *rootViewController = nil;
static void(^completionBlock)(KRNSendEmailResult result, NSError *error);


@implementation KRNSendEmail

+ (BOOL)canSend {
    return [MFMailComposeViewController canSendMail];
}

+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipient:(NSString *)recipient withSubject:(NSString *)subject withMessage:(NSString *)message withCompletion:(void(^)(KRNSendEmailResult result, NSError *error)) completion {
    return [self sendFromViewController:viewController toRecipients:@[recipient] withSubject:subject withMessage:message withCompletion:completion];
}

+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipients:(NSArray<NSString *>*)recipients withSubject:(NSString *)subject withMessage:(NSString *)message withCompletion:(void(^)(KRNSendEmailResult result, NSError *error)) completion {
    
    completionBlock = completion;
    rootViewController = viewController;
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc]init];
    
    if (!mailController) return NO;
    
    [mailController setMailComposeDelegate:[self self]];
    
    if (recipients) {
        NSMutableArray<NSString *> *checkedRecipients = [NSMutableArray new];
        for (id recipient in recipients) {
            if ([recipient isKindOfClass:[NSString class]]) {
                [checkedRecipients addObject:recipient];
            }
        }
        [mailController setToRecipients:[checkedRecipients copy]];
    }
    if (subject) {
        [mailController setSubject:subject];
    }
    if (message) {
        [mailController setMessageBody:message isHTML:NO];
    }
    
    [rootViewController presentViewController:mailController animated:YES completion:nil];
    
    return YES;
}


#pragma mark - MFMailComposeViewControllerDelegate

+ (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [rootViewController dismissViewControllerAnimated:YES completion:^{
        if (completionBlock) {
            KRNSendEmailResult emailResult = [self mapResultFromMFMailComposeResult:result];
            completionBlock(emailResult, error);
        }
    }];
}

#pragma mark - Helpers

+ (KRNSendEmailResult)mapResultFromMFMailComposeResult:(MFMailComposeResult)result {
    if (result == MFMailComposeResultCancelled) {
        return KRNSendEmailResultCancelled;
    } else if (result == MFMailComposeResultSent) {
        return KRNSendEmailResultSent;
    } else if (result == MFMailComposeResultSaved) {
        return KRNSendEmailResultSaved;
    } else {
        return KRNSendEmailResultFailed;
    }
}

+ (NSString *)sendEmailResultStringRepresentation:(KRNSendEmailResult)result {
    if (result == MFMailComposeResultCancelled) {
        return @"Sending email was cancelled";
    } else if (result == MFMailComposeResultSent) {
        return @"The email message was queued in your outbux. It will be send when you connect to your email.";
    } else if (result == MFMailComposeResultSaved) {
        return @"The email message was saved in your Drafts folder";
    } else {
        return @"Sending email was failed";
    }
}

@end
