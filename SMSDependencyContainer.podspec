Pod::Spec.new do |s|
  s.name         = "SMSDependencyContainer"
  s.version      = "0.1"
  s.summary      = "IOC container for Objective C applications."
  s.homepage     = "http://git.societymedia.com"
  s.license      = { :type => 'MIT', :text => 'LICENSE' }
  s.author       = { "Societymedia Services" => "tony@societymedia.com" }
  s.source       = { :git => "git@github.com:societymedia/SMSDependencyContainer.git"}
  s.platform     = :ios, "6.0"
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end
