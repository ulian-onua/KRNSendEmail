Pod::Spec.new do |s|

  s.name         = "KRNSendEmail"
  s.version      = "0.0.2"
  s.summary      = "KRNSendEmail is a simple class that helps you to send email from iOS application"

  s.homepage     = "https://github.com/ulian-onua/KRNSendEmail"

  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author              = { "Julian Drapaylo" => "ulian.onua@gmail.com" }
  #s.social_media_url   = "http://www.linkedin.com/in/julian-drapaylo"


  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRNSendEmail.git", :tag => "0.0.2" }


  s.source_files  = "KRNSendEmail/*.{h,m}"
  s.public_header_files = "KRNSendEmail/*.h"

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

end
