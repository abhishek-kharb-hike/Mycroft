
Pod::Spec.new do |s|
  s.name             = 'MycroftSource'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MycroftSource.'
  s.homepage         = 'https://github.com/abhishek-kharb-hike/Mycroft'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abhishek-kharb-hike' => 'abhishekkh@hike.in' }
  s.source           = { :git => 'https://github.com/abhishek-kharb-hike/Mycroft.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'MycroftSource/Classes/**/*.{h,m}'

end
