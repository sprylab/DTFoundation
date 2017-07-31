Pod::Spec.new do |spec|
  spec.name         = 'DTFoundation'
  spec.version      = '2.2.0'
  spec.summary      = "Standard toolset classes and categories."
  spec.homepage     = "https://github.com/Cocoanetics/DTFoundation"
  spec.author       = { "Oliver Drobnik" => "oliver@drobnik.com" }
  spec.source       = { :git => "https://github.com/sprylab/DTFoundation.git", :tag => spec.version.to_s }

  spec.ios.deployment_target = '9.0'
  spec.osx.deployment_target = '10.8'
  
  spec.license      = 'BSD'
  spec.requires_arc = true


  spec.subspec 'Core' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.8'
    ss.source_files = 'Core/Source/*.{h,m}'
  end

  spec.subspec 'UIKit' do |ss|
    ss.platform = :ios, '8.0'
    ss.dependency 'DTFoundation/Core'
    ss.ios.frameworks = 'QuartzCore'
    ss.ios.source_files = 'Core/Source/iOS/*.{h,m}'
  end

  spec.subspec 'UIKit_BlocksAdditions' do |ss|
    ss.platform = :ios, '8.0'
    ss.dependency 'DTFoundation/Core'
    ss.ios.source_files = 'Core/Source/iOS/BlocksAdditions/*.{h,m}'
  end

  spec.subspec 'AppKit' do |ss|
    ss.platform = :osx, '10.8'
    ss.dependency 'DTFoundation/Core'
    ss.osx.source_files = 'Core/Source/OSX/*.{h,m}'
  end

  spec.subspec 'DTAWS' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.8'
    ss.dependency 'DTFoundation/Core'
    ss.source_files = 'Core/Source/DTAWS/*.{h,m}'
  end

  spec.subspec 'DTASN1' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.8'
    ss.dependency 'DTFoundation/Core'
    ss.source_files = 'Core/Source/DTASN1/*.{h,m}'
  end

  spec.subspec 'DTHTMLParser' do |ss|
    ss.osx.deployment_target = '10.8'
    ss.ios.deployment_target = '9.0'
    ss.dependency 'DTFoundation/Core'
    ss.source_files = 'Core/Source/DTHTMLParser/*.{h,m}'
    ss.library = 'xml2'
    ss.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  end

  spec.subspec 'DTReachability' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.8'
    ss.framework = 'SystemConfiguration'
    ss.source_files = 'Core/Source/DTReachability/*.{h,m}'
    ss.dependency 'DTFoundation/Core'
  end

  spec.subspec 'DTSidePanel' do |ss|
    ss.platform = :ios, '8.0'
    ss.dependency 'DTFoundation/UIKit'
    ss.ios.frameworks = 'QuartzCore'
    ss.ios.source_files = 'Core/Source/iOS/DTSidePanel/*.{h,m}'
  end

  spec.subspec 'DTSQLite' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.8'
    ss.library = 'sqlite3'
    ss.source_files = 'Core/Source/DTSQLite/*.{h,m}'
    ss.private_header_files = 'Core/Source/DTSQLite/DTSQLiteFunctions.h'
    ss.dependency 'DTFoundation/Core'
  end

  spec.subspec 'DTUTI' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.ios.frameworks = ['MobileCoreServices']
    ss.source_files = 'Core/Source/DTUTI/*.{h,m}'
  end

  spec.subspec 'DTZipArchive' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'Core/Source/DTZipArchive/*.{h,m}'
    ss.library = 'z'

    # Ideally minizip should have a Pod
    # ss.dependency 'Minizip'
    ss.subspec 'Minizip' do |sss|
      sss.source_files = 'Core/Source/Externals/minizip/*.{h,c}'
      sss.private_header_files = 'Core/Source/Externals/minizip/*.h'
    end
  end
  
  spec.subspec 'Runtime' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.8'
    ss.source_files = 'Core/Source/Runtime/*.{h,m}'
  end

end
