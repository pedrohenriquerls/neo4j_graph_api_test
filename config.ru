Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

root = ::File.dirname(__FILE__)
require ::File.join(root, 'app/app')
run App.new
