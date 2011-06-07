# vim: fileencoding=utf-8

require 'bundler'

Bundler.require

lib_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'endless_orange'

run EndlessOrange::Application
