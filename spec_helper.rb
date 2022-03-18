#------------------------------- 
#Filename: spec_helper.rb
#Author: Christopher De Lano
#File Creation Date: 10-25-16
#Last Update - 10-28-16
#Version 1.0
#-------------------------------

#require 'selenium-webdriver'
require 'watir-webdriver'
require 'rails'
require 'spreadsheet'
require 'watir-scroll'
require 'os'
#require 'rspec-core'
#require 'page-object'
require_relative 'platformtabobjects.rb'
require_relative 'createeditobjects.rb'
require_relative 'managetabobjects.rb'
require_relative 'methods.rb'

Watir.default_timeout = 90


#@browser = Watir::Browser.new :chrome
#@browser.goto "https://go.bn.co/login/#/signin"
