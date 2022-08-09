Pod::Spec.new do |s|
  s.name             = 'SmoothFrame'
  s.version          = '0.0.3'
  s.summary          = 'A short description of SmoothFrame.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/akateason/SmoothFrame'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'teason' => 'akateason@qq.com' }
  s.source           = { :git => 'https://github.com/akateason/SmoothFrame.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SmoothFrame/Classes/**/*'

  # s.resource_bundles = {
  #   'SmoothFrame' => ['SmoothFrame/Assets/*.png']
  # }

  #s.subspec 'SmoothFrame' do | sm |
      #sm.source_files = 'SmoothFrame/ZYSubModule/**/*'
      #sm.dependency 'AFNetworking', '~> 2.3'
  #end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
