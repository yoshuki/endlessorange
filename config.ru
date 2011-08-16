# vim: fileencoding=utf-8

$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'bundler/setup'
require 'endless_orange'

run EndlessOrange::Application
