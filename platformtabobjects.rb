#------------------------------- 
#Filename: platformobjects.rb
#Author: Christopher De Lano
#File Creation Date: 10-25-16
#Last Update - 11-18-16
#Version 1.0
#------------------------------- 

def email 
	@browser.input(:id=> 'email')
end

def password
	@browser.input(:id=> 'password')
end

def signin
	@browser.button(:class=> 'button', :text=> "Sign In")
end

def integrations
	@browser.a(:text=> "Integrations")
end

def publish_a
	@browser.a(:text=> "Publish")
end

def publish_text
	@browser.div(:text=> "Publish")
end

def selector_carrot
	@browser.i(:class=> 'icon-arrow-down')
end

def search_teams
	@browser.input(:placeholder=> "Search Teams")
end

def select_content
	@browser.div(:class=> 'stretch', :text=> "Content")
end

def select_qatesting
	@browser.div(:class=> 'stretch', :text=> "QATesting")
end

def publishqa_integration
	@browser.div(:class=>'meta-text', :text=> "Publish QA")
end