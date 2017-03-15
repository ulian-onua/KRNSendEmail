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

Before sending email you should check if your system supports this. Use method `+(BOOL)canSend` for this purpose.

```objc
  if ([KRNSendEmail canSend]) {
    // call method to send email
}
```

For sending mails you can use one of next convenient methods:

```objc
+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipient:(NSString *)recipient withSubject:(NSString *)subject withMessage:(NSString *)message withCompletion:(void(^)(KRNSendEmailResult result, NSError *error)) completion; // send email to one recipient

+ (BOOL)sendFromViewController:(UIViewController *)viewController toRecipients:(NSArray<NSString *>*)recipients withSubject:(NSString *)subject withMessage:(NSString *)message withCompletion:(void(^)(KRNSendEmailResult result, NSError *error)) completion; // send email to many recipients
```
As a result completion block will be called where you can handle result in a KRNSendEmailResult enum parameter. You get convenient string representation of this enum by calling `+(NSString *)sendEmailResultStringRepresentation:(KRNSendEmailResult)result` method.


## Requirements

* iOS 8.0 and above
* XCode 7+
* Example project can be launched from iOS 9 and later.

## License

KRNSendEmail is released under the MIT license. See LICENSE for details.

## Contact

Any suggestion or question? Please create a Github issue or reach me out.

[LinkedIn](https://www.linkedin.com/in/julian-drapaylo)
