//
//  ViewController.m
//  KRNShareEmailExample
//
//  Created by ulian_onua on 3/15/17.
//  Copyright © 2017 ulian_onua. All rights reserved.
//

#import "ViewController.h"
#import "KRNSendEmail.h"
#import "KRNImageAttachment.h"

@interface ViewController ()<UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstEmail;
@property (weak, nonatomic) IBOutlet UITextField *secondEmail;
@property (weak, nonatomic) IBOutlet UITextField *subject;
@property (weak, nonatomic) IBOutlet UITextView *message;
@end

@implementation ViewController

#pragma mark - Actions
- (IBAction)sendButtonPressed:(id)sender {
    [self.view endEditing:YES];
    if ([KRNSendEmail canSend]) {
        UIImage *image = [UIImage imageNamed:@"schoolFullImage"];
        UIImage *image2 = [UIImage imageNamed:@"babyFullImage"];
        KRNImageAttachment *attachment = [KRNImageAttachment pngAttachmentWithImage:image andName:@"school"];
        KRNImageAttachment *attachment2 = [KRNImageAttachment pngAttachmentWithImage:image2 andName:@"baby"];

        [KRNSendEmail sendFromViewController:self toRecipients:@[_firstEmail.text, _secondEmail.text] withSubject:_subject.text withMessage:_message.text withAttachments:@[attachment, attachment2] withCompletion:^(KRNSendEmailResult result, NSError *error) {
            if (error) {
                NSLog(@"Error - %@", error.localizedDescription);
            } else {
                NSLog(@"%@", [KRNSendEmail sendEmailResultStringRepresentation:result]);
            }
        }];
    }
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - dealloc

- (void)dealloc {
    NSLog(@"View controller was deallocated");
}


@end
