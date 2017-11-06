Pod::Spec.new do |s|
  s.name                  = 'ScrollViewKeyboardAvoider'
  s.version               = '1.0.0'
  s.summary               = 'Make UIScrollView adjust insets so the keyboard does not cover content'
  s.homepage              = 'https://github.com/darrarski/ScrollViewKeyboardAvoider'
  s.author                = { 'Dariusz Rybicki' => 'darrarski@gmail.com' }
  s.social_media_url      = 'https://twitter.com/darrarski'
  s.license               = { :type => 'MIT', 
                              :file => 'LICENSE' }
  s.source                = { :git => 'https://github.com/darrarski/ScrollViewKeyboardAvoider.git', 
                              :tag => "v#{s.version}" }
  s.platform              = :ios
  s.ios.deployment_target = '11.1'
  s.source_files          = 'Sources'
  s.requires_arc          = true
  s.frameworks            = 'UIKit'
  
  s.dependency 'KeyboardFrameChangeListener', '~> 1.0'
end
