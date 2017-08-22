Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "TLExtension"
  s.version      = "1.0.0"
  s.summary      = "Extensions collection"
  s.description  = "Useful swift extension for iOS development"
  s.homepage     = "https://github.com/lee5783/TLExtension.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = { :type => "Apache License 2.0", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author             = "lee5783"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "8.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/lee5783/TLExtension.git", :tag => "1.0.0" }
  # s.source       = { :path => '.' }

  s.dependency 'Localize-Swift', '~> 1.7'

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #s.source_files  = "TLExtension/Classes", "TLExtension/Classes/**/*.{h,m,swift}"
  s.subspec 'UIKit' do |uikit|
   uikit.source_files = 'TLExtension/Classes/UIKit/*.{m,h,swift}'
  end

  s.subspec 'Foundation' do |foundation|
    foundation.source_files = 'TLExtension/Classes/Foundation/*.{m,h,swift}'
    #cells.dependency 'iOSShared/Core'
  end
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }
end
