#
# Be sure to run `pod lib lint TwitchAPIWrapper.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = 'TwitchAPIWrapper'
  s.version          = '1.0.0'
  s.summary          = 'An API wrapper for the Twitch API including Authentication.'
  s.description      = <<-DESC
  The Twitch API Wrapper is an HTTP Client for the Twitch API that includes Object mappings to the different Twitch endpoints that can be easily displayed utilizing the provided DataSources. The library also contains an OAuth Client allowing access to Twitch's secure endpoints as well as OAuth for your application.
                       DESC

  s.homepage         = 'https://github.com/epv44/TwitchAPIWrapper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'epv44' => 'epv9@case.edu' }
  s.source           = { :git => 'https://github.com/epv44/TwitchAPIWrapper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/TwitchAPIWrapper/**/*'
  
#  s.test_spec 'Tests' do |test_spec|
#      test_spec.source_files = 'Tests/**/*'
#      test_spec.dependency 'XCTest' # This dependency will only be linked with your tests.
#  end
  s.dependency 'KeychainAccess', '~> 4.2'
end
