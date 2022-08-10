Pod::Spec.new do |s|
  s.name             = 'SmoothFrame'
  s.version          = '1.0.0'
  s.summary          = 'TRY SmoothFrame!!!!! 一个SnapKit的frame版本'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/akateason/SmoothFrame'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'teason' => 'akateason@qq.com' }
  s.source           = { :git => 'https://github.com/akateason/SmoothFrame.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SmoothFrame/SmoothFrame/**/*'

end
