# vim: fileencoding=utf-8

lib_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'bundler/setup'
require 'endless_orange'

run EndlessOrange::Application
