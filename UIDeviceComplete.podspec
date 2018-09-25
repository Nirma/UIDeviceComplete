Pod::Spec.new do |s|
  s.name             = 'UIDeviceComplete'
  s.version          = '2.2.0'
  s.summary          = 'UIDevice extensions for device Model, Family, Screen size and more'
 
  s.description      = <<-DESC
UIDevice is handy and serves a purpose but it does lack the ability to do things like
provide the screen size in inches or provide specific device model or family info.

Thats where this library comes in, a super light weight and simple set of extensions to
UIDevice that make UIDevice even more fun to work with.
                       DESC
 
  s.homepage         = 'https://github.com/Nirma/UIDeviceComplete'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nicholas Maccharoli' => 'nmaccharoli@gmail.com' }
  s.source           = { :git => 'https://github.com/Nirma/UIDeviceComplete.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'Sources/*.swift'
end
