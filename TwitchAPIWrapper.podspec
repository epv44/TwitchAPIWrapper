
Pod::Spec.new do |s|
  s.name             = 'TwitchAPIWrapper'
  s.version          = '0.0.1'
  s.homepage         = 'https://github.com/epv44/TwitchAPIWrapper'
  s.author           = { 'Eric Vennaro' => 'epv9@case.edu' }
  s.summary          = 'Develpment kit for working with the Twitch API for iOS'
  s.description      = <<-DESC
Development Kit for Twitch API, includes OAuth and models for endpoints
                       DESC

  s.homepage         = 'https://github.com/epv44/TwitchAPIWrapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Eric Vennaro' => 'epv9@case.edu' }
  s.source           = { :git => 'https://github.com/epv44/TwitchAPIWrapper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Source/*.swift'
  
  # s.resource_bundles = {
  #   'EVSlidingTableViewCell' => ['EVSlidingTableViewCell/Classes/**/*.{xib}']
  # }
end
