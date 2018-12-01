#
# Be sure to run `pod lib lint InterviewKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InterviewKit'
  s.version          = '0.1.0'
  s.summary          = 'Useful functions for making an interview showcase app'

  s.homepage         = 'https://github.com/spaghetticoderapps@gmail.com/InterviewKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'spaghetticoderapps@gmail.com' => 'spaghetticoderapps@gmail.com' }
  s.source           = { :git => 'https://github.com/spaghetticoderapps/InterviewKit.git'}

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source_files = 'InterviewKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'InterviewKit' => ['InterviewKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
