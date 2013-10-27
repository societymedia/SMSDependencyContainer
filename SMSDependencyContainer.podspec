Pod::Spec.new do |s|
  s.name         = "SMSDependencyContainer"
  s.version      = "0.0.1"
  s.summary      = "IOC container for Objective C applications."
  s.license      = { :type => "MIT", :text => "LICENSE" }
  s.author       = { "Societymedia Services" => "tony@societymedia.com" }
  s.source       = {
    :git => "git@github.com:societymedia/SMSDependencyContainer.git",
    :tag => "0.0.1"
  }
  s.source_files = 'Classes/*.{h,m}'
  s.requires_arc = true
end
