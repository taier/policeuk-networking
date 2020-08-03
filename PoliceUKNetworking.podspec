#
# Be sure to run `pod lib lint PoliceUKNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PoliceUKNetworking'
  s.version          = '1.0.2'
  s.summary          = 'A networking library that gets crime data from https://www.police.uk/'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A networking library wraps requests from https://www.police.uk/ into a complete swift objects
                       DESC

  s.homepage         = 'https://github.com/taier/policeuk-networking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Deniss Kaibagarovs' => 'deniss.kaibagarovs@gmail.com' }
  s.source           = { :git => 'https://github.com/taier/policeuk-networking.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/TheTaier'

  s.ios.deployment_target = '10.0'
  s.swift_versions = "5.0"

  s.source_files = 'PoliceUKNetworking/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PoliceUKNetworking' => ['PoliceUKNetworking/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.dependency 'Alamofire', '~> 5.2'
   s.dependency 'RxSwift', '~> 5.1.1'
   s.dependency 'RxCocoa', '~> 5.1.1'
end
