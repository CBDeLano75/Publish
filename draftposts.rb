#------------------------------- 
#Filename: drafts.rb 
#Author: Christopher De Lano
#Original File Creation Date: 9-14-16
#Refactor File Creation Date: 12-01-16
#Last Update - 12-01-16
#Version 1.0 
#------------------------------- 

require_relative 'spec_helper' 

Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open 'PostTest.xls'
sheet1 = book.worksheet 4
sheet1.each 1 do |row|	
break if row [0].nil?
$column = row
action = $column[0]
browsertype = $column[1]
testcase = $column[2]
newtestcase = $column[3]
account = $column[4]
post_type = $column[5]
cont_recom = $column[6]
topic = $column[7]
subtopic= $column[8]

today = Date.today
current_day = "#{today.day}"
tomorrow = Date.current.tomorrow
next_day = "#{tomorrow.day}" #Can add a " + x" to add more time, but it breaks down when trying to go to the following week
#next_day = "#{today.day}"
current = DateTime.now
month = current.month
time = Time.new
time = (time.hour.to_s + ":" + time.min.to_s)
result1 = 'Pass'
result2 = 'Fail'
extension = '.png'
attempt = 1
filename = File.basename(__FILE__)
 
begin
login_qatesting_admin

bnnorth.wait_until_present

if clear_assets.visible? == true
	clear_assets.click
end

if "F".in? account
	bnnorth.wait_until_present
	bnnorth.click
end

if "T".in? account
	bnnorthchild0.wait_until_present
	bnnorthchild0.click
end

if "P".in? account
	pin_josh5947.wait_until_present
	pin_josh5947.click
end

sleep 1

close_publish_bar.click
view_publications

facebookmessage = (testcase + " - " + account)
twittermessage = (testcase + " - " + account)
pinterestmessage = (testcase + " - " + account)

newfacebookmessage = (newtestcase + " - " + account)
newtwittermessage = (newtestcase + " - " + account)
newpinterestmessage = (newtestcase + " - " + account)

if (action == 'Create')
	create.click
	if ("F".in? account)
		facebook_message.wait_until_present
		facebook_message.send_keys (facebookmessage)
		if media_library_0.visible? == true
			media_library_1.fire_event :click
		else
			media_library_0.fire_event :click
		end
 		add_photo_seasons(topic, subtopic)
	end

	if ("T".in? account)
		twitter_message.wait_until_present
		twitter_message.send_keys (twittermessage)
		if media_library_0.visible? == true
			media_library_2.fire_event :click
		else
			media_library_1.fire_event :click
		end
		add_photo_seasons(topic, subtopic)
	end

	if ("P".in? account)
		pinterest_message.wait_until_present
		pinterest_message.send_keys (pinterestmessage)
		if media_library_0.visible? == true
			media_library_3.fire_event :click
		else
			media_library_2.fire_event :click
		end
		add_photo_seasons(topic, subtopic)
		#pinterest_tag(pinteresttag)
		pinterest_board
	end
	publication_name.to_subtype.clear
	publication_name.send_keys (action + " - " + testcase)
	#publication_name.send_keys (action + " - " + testcase + " - " + account + " - " + topic + " - " + subtopic)
	add_comment(action)
	schedule_draft
end	

if (action == 'Edit')
	#loading_spinner.wait_while_present
	filter_for_draft
	loading_spinner.wait_while_present
	if "F".in? account
		facebook_action(facebookmessage).click
		sleep 1
		facebook_edit(facebookmessage).fire_event :click
	end
	if account == 'T'
		twitter_action(twittermessage).click
		sleep 1
		#twitter_edit(twittermessage).wait_until_present
		twitter_edit(twittermessage).fire_event :click
	end
	if account == 'P'
		pinterest_action(pinterestmessage).click
		sleep 1
		pinterest_edit(pinterestmessage).fire_event :click
	end
	
	schedule_post.wait_until_present(360)
	sleep 1
	fleeting_notification.wait_while_present

	if ("F".in? account)
		facebook_message.wait_until_present
		add_newfacebookmessage(newfacebookmessage)
	end
	if ("T".in? account)
		twitter_message.wait_until_present
		add_newtwittermessage(newtwittermessage)
	end
	if ("P".in? account)
		pinterest_message.wait_until_present
		add_newpinterestmessage(newpinterestmessage)
	end

	publication_name.to_subtype.clear
	publication_name.send_keys (action + " - " + testcase)

	#sleep 1
	schedule_post.click
  	#schedule_post_publish.click

	publication_name.wait_while_present(360)
end

table_loader.wait_while_present(180)

open('results.csv', 'a') {|f|
f.puts ("#{filename}, #{result1}, #{testcase}, #{account}")
}
rescue Exception => e
	attempt += 1
	if attempt > 2
	open('results.csv', 'a') {|f|
	f.puts ("#{filename}, #{result2}, #{testcase}, #{account}, #{e}")
	@browser.screenshot.save ("Failed Draft" + " " + testcase + " " + account + "  " + extension)
	}
	else
	@browser.close
		retry
	end
end   

#Close Browser
@browser.close
end 