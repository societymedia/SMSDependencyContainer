Pod::Spec.new do |s|
  s.name         = "AWE"
  s.version      = "2.2.1"
  s.summary      = "Foundation project for NBCU brand applications."
  s.homepage     = "http://www.bottlerocketapps.com"
  s.license      = { :type => 'BR', :text => <<-LICENSE
  											Only for Employees of BottleRocket Apps
  												LICENSE
  				  	}
  s.author       = { "BottleRocketApps" => "amanda.chappell@bottlerocketapps.com" }
  s.source       = { :http => "http://sandbox.bottlerocketapps.com/CocoaPods/AWE/2_2_1/_AWE_iOS_2_2_1_Universal_30-Debug.zip", :flatten => true}
  s.platform     = :ios, "6.0"
  s.source_files = '**/*.{h}'
  s.preserve_paths = 'libAWEUniversal-Debug-VERSION-c13c211.a'
  s.exclude_files = 'Resources/iPad/ColorConfig~ipad.plist', 'Resources/iPad/FontConfig~ipad.plist', 'Resources/iPhone/ColorConfig~iphone.plist', 'Resources/iPhone/FontConfig~iphone.plist', 'Resources/AirshipConfig.plist', 'Default-568h@2x.png'
  s.requires_arc = true
  s.library = 'AWEUniversal-Debug-VERSION-c13c211'
  s.resources = '**/*.{xib,png,jpg,jpeg,plist}'
  s.frameworks = 'StoreKit', 'EventKitUI', 'EventKit', 'CoreLocation', 'Accounts', 'Social', 'Twitter', 'MessageUI', 'Security', 'CoreMedia', 'AVFoundation', 'MediaPlayer', 'MobileCoreServices', 'ImageIO', 'QuartzCore', 'SystemConfiguration', 'CoreData', 'UIKit', 'Foundation', 'CoreGraphics', 'CoreFoundation', 'AudioToolbox', 'AdSupport'
  s.xcconfig  =  { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/AWE"', 'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/AWE/Headers"' }
	
  s.dependency 'BRNetworking', '1.0'
end
