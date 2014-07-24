Pod::Spec.new do |s|
  s.name         = "SESlideTableViewCell"
  s.version      = "0.1.0"
  s.summary      = "UITableViewCell subclass which shows buttons with sliding it."
  s.homepage     = "http://www.space-elephant.com"
  s.screenshots  = "i.imgur.com/NUJ9Hts.gif", "i.imgur.com/ic1fwxp.gif"
  s.license      = "MIT"
  s.author       = { "Junji Tago" => "junji.tago@space-elephant.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/spaceelephant/SESlideTableViewCell.git", :tag => "0.1.0" }
  s.source_files  = "SESlideTableViewCell/lib"
  s.public_header_files = "SESlideTableViewCell/lib/*.h"
end
