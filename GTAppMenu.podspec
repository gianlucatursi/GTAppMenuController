Pod::Spec.new do |s|
    s.name                  = 'GTAppMenuController'
    s.version               = '1.1.0'
    s.summary               = 'Inspired by Paper application of Facebook.'
    s.license               = 'MIT'
    s.authors               = { 'Gianluca Tursi' => 'gian.tursi@gmail.com' }
    s.homepage              = 'https://github.com/gianlucatursi/GTAppMenuController'
    s.source                = { git: 'https://github.com/gianlucatursi/GTAppMenuController.git', :tag => "v#{s.version}" }
    s.ios.deployment_target = '8.0'
    s.requires_arc          = true
    s.source_files          = 'GTAppMenuController/GTAppMenuController.{h,m}'
    s.ios.framework         = 'Foundation', 'CoreGraphics', 'UIKit'
end
