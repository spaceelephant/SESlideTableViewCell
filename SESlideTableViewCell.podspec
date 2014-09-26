Pod::Spec.new do |s|
  s.name         = "SESlideTableViewCell"
  s.version      = "0.2.1"
  s.summary      = "A subclass of UITableViewCell that shows buttons with swiping it."
  s.homepage     = "https://github.com/spaceelephant/SESlideTableViewCell"
  s.screenshots  = "http://i.imgur.com/395rqmq.gif"
  s.license      = "MIT"
  s.author       = { "Junji Tago" => "junji.tago@space-elephant.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/spaceelephant/SESlideTableViewCell.git", :tag => "0.2.1" }
  s.source_files  = "SESlideTableViewCell/lib"
  s.public_header_files = "SESlideTableViewCell/lib/*.h"
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
end
