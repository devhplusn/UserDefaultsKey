Pod::Spec.new do |spec|
  spec.name             = 'UserDefaultsKey'
  spec.version          = '1.0.0'
  spec.summary          = 'UserDefaultsKey'
  spec.homepage         = 'https://github.com/devhplusn/UserDefaultsKey'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Hanwoong Na' => 'devhplusn@gmail.com' }
  spec.source           = { :git => 'https://github.com/devhplusn/UserDefaultsKey.git', :tag => spec.version.to_s }

  spec.ios.deployment_target      = '11.0'
  spec.osx.deployment_target      = '10.9'
  spec.watchos.deployment_target  = '3.0'
  spec.swift_versions             = ['5']
  spec.source_files               = 'Sources/UserDefaultsKey/**/*'

end
