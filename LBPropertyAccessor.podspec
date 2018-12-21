#
# Be sure to run `pod lib lint LBPropertyAccessor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LBPropertyAccessor'
  s.version = '0.1.0'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'A easy way to access one object property.'
  s.homepage         = 'https://github.com/s2eker/LBPropertyAccessor'
  s.author           = { 's2eker' => '294842586@qq.com' }
  s.source           = { :git => 'https://github.com/s2eker/LBPropertyAccessor.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'LBPropertyAccessor/Classes/**/*'
end
