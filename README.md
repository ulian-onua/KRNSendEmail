KRNSendEmail
===============

KRNSendEmail is a simple class that helps you to send emails from your iOS app.


## Installation
####CocoaPods

(Unfamiliar with [CocoaPods](http://cocoapods.org/) yet? It's a dependency management tool for iOS and Mac, check it out!)

Just add `pod 'KRNSendEmail'` to your Podfile and run `pod install` in Terminal from your project folder.

Write `#import "KRNSendEmail.h"` in files where you need to use KRNSendEmail. 


## How to use
All methods of KRNSendEmail are static so you can simply call any of method without necessity of allocation of KRNSendEmail instance.
### Check if system supports sending e-mails
Before sending email you should check if your system supports this. Use method `+(BOOL)canSend` for this purpose.

```objc
  if ([KRNSendEmail canSend]) {
    // call method to send email
}
```

### Send e-mails without attachments

For sending mails you can use one of next convenient methods:

```objc
+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipient:(NSString *)recipient withSubject:(NSString *)subject withMessage:(NSString *)message withCompletion:(void(^)(KRNSendEmailResult result, NSError *error)) completion; // send email to one recipient

+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipients:(NSArray<NSString *>*)recipients withSubject:(NSString *)subject withMessage:(NSString *)message withCompletion:(void(^)(KRNSendEmailResult result, NSError *error)) completion; // send email to many recipients
```
As a result completion block will be called where you can handle result in a KRNSendEmailResult enum parameter. You get convenient string representation of this enum by calling `+(NSString *)sendEmailResultStringRepresentation:(KRNSendEmailResult)result` method.

### Send e-mails with attachments
To send email with an attachment/attachments you have to create an instance (or several ones) of `KRNEmailAttachment` class. 
Every instance or KRNEmailAttachments requires NSData that will play role of attachment, NSString with mime-type of attachment and NSString as fileName of attachment. If filename is nil random filename will be generated.
You can subclass KRNEmailAttachments class to simplify adding often used attachments. Library already has KRNImageAttachment class that you can use to add UIImage instances as attachments.

One or several KRNEmailAttachments you pass to appropriate static method of KRNSendEmail class like in the example below.

```objc
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
```



## Requirements

* iOS 8.0 and above
* XCode 7+
* Example project can be launched from iOS 9 and later.

## License

KRNSendEmail is released under the MIT license. See LICENSE for details.

## Contact

Any suggestion or question? Please create a Github issue or reach me out.

[LinkedIn](https://www.linkedin.com/in/julian-drapaylo)
