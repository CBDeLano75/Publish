#------------------------------- 
#Filename: cleanupposts.rb
#Author: Christopher De Lano
#Original File Creation Date: 6-10-15
#refactor File Creation Date: 11-18-16
#Last Update - 11-18-16
#Version 1.0
#-------------------------------

require_relative 'spec_helper' 

attempt = 1

result2 = 'Fail'
testcase = 'Delete'
extension = '.png'
filename = File.basename(__FILE__)


begin 
login_qatesting_admin
bnnorth.wait_until_present

if clear_assets.visible? == true
	clear_assets.click
end

bnnorth.wait_until_present
#bnnorth.click
bnrocks.click

close_publish_bar.click

icon_spinner.wait_while_present(180)

#DeletePosts
sleep 1
search_icon.wait_until_present
search_icon.click
search_box.wait_until_present
search_box.send_keys ("message: "+ "Library")
icon_spinner.wait_while_present(180)
bulk_checkbox.wait_until_present
bulk_select.fire_event :click
sleep 1
filter_delete.fire_event :click
sleep 1
@browser.iframe.screenshot.save ("DeletedPosts" + extension)
sleep 1
confirm_delete.when_present.click

icon_spinner.wait_while_present(180)
sleep 2

rescue Exception => e
	attempt += 1
	if attempt > 2
		open('results.csv', 'a') {|f|
		f.puts ("#{filename}, #{testcase},#{result2},#{e}")
		}
		@browser.iframe.close
	else
	@browser.iframe.close
	retry
	end
end 
#Close browser.iframe
@browser.iframe.close
#end