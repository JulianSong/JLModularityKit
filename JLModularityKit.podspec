Pod::Spec.new do |s|
  s.name             = 'JLModularityKit'
  s.version          = '0.1.0'
  s.summary          = 'IOS 7 JLModularityKit.'
  s.description      = <<-DESC
IOS 7 JLModularityKit modularity and configable tableview.
                       DESC
  s.homepage         = 'https://github.com/JulianSong/JLModularityKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'junliang.song' => 'junliang.song@dianping.com' }
  s.source           = { :git => 'https://github.com/JulianSong/JLModularityKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'JLModularityKit/Classes/*'
  s.public_header_files = 'JLModularityKit/Classes/*.h'
  s.frameworks = 'UIKit'
end
