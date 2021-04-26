#
# Be sure to run `pod lib lint TwitchAPIWrapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TwitchAPIWrapper'
  s.version          = '0.1.0'
  s.summary          = 'An API wrapper for the Twitch API including Authentication.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  The Twitch API Wrapper is an HTTP Client for the Twitch API that includes Object mappings to the different Twitch endpoints that can be easily displayed utilizing the provided DataSources. The library also contains an OAuth Client allowing access to Twitch's secure endpoints as well as OAuth for your application.
                       DESC

  s.homepage         = 'https://github.com/epv44/TwitchAPIWrapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'epv44' => 'epv9@case.edu' }
  s.source           = { :git => 'https://github.com/epv44/TwitchAPIWrapper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.1'
  s.swift_version = '5.0'
  s.source_files = 'Lib/**/*'
  
  # s.resource_bundles = {
  #   'TwitchAPIWrapper' => ['TwitchAPIWrapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'KeychainAccess', '~> 4.2'
end
