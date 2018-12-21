#
# Be sure to run `pod lib lint LBPropertyAccessor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LBPropertyAccessor'
  s.version          = '0.1.0'
  s.summary          = 'A easy way to access one object's property.'
  s.description      = <<-DESC
A easy way to get one object's property's value or set its property's value
                       DESC
  s.homepage         = 'https://github.com/s2eker/LBPropertyAccessor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 's2eker' => '294842586@qq.com' }
  s.source           = { :git => 'https://github.com/s2eker/LBPropertyAccessor.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'LBPropertyAccessor/Classes/**/*'
end
