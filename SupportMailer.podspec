#
# Be sure to run `pod lib lint SupportMailer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SupportMailer'
  s.version          = '0.1.0'
  s.summary          = 'MFMailComposeViewController subclass that attaches the device info to the body of the email.'
  s.homepage         = 'https://github.com/mafellows/SupportMailer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Fellows' => 'michael.fellows12@gmail.com' }
  s.source           = { :git => 'https://github.com/Michael Fellows/SupportMailer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mafellows'
  s.ios.deployment_target = '10.0'
  s.source_files = 'SupportMailer/Classes/**/*'
  s.frameworks = 'MessageUI'
end
