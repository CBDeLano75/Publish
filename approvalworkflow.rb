#-------------------------------  
#Filename: approvalworkflow.rb
#Author: Christopher De Lano
#Original File Creation Date: 10-14-16
#refactor File Creation Date: 11-09-16
#Last Update - 11-18-16
#Version 1.0
#-------------------------------
 
require_relative 'spec_helper' 

Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open 'posttest.xls' 
sheet1 = book.worksheet 5
sheet1.each 1 do |row|	
break if row [0].nil?
$column = row
action = $column[0]
browser.iframetype = $column[1]
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

if action == 'Approve'
	login_qatesting_admin
end
if action == 'Reject'
	login_qatesting_admin
end
if action == 'Create'
	login_qatesting_basic_publisher
end
if action == 'Edit'
	login_qatesting_basic_publisher
end

bnnorth.wait_until_present

if clear_assets.visible? == true
	clear_assets.click
end


if "F".in? account
	bnnorth.wait_until_present
	#bnnorth.click
	bnrocks.click
end

if "T".in? account
	bnnorthchild0.wait_until_present
	bnnorthchild0.click
end

if "P".in? account
	pin_josh5947.wait_until_present
	pin_josh5947.click
end

close_publish_bar.click
view_publications

facebookmessage = (testcase)
twittermessage = (testcase)
pinterestmessage = (testcase)

newfacebookmessage = (testcase + " - " + newtestcase)
newtwittermessage = (testcase + " - " + newtestcase)
newpinterestmessage = (testcase + " - " + newtestcase)

if (action == 'Create')
	create.click
	if ("F".in? account) & (cont_recom == 'WYOP')
		facebook_message.wait_until_present
		facebook_message.send_keys (facebookmessage)
	end
	if ("T".in? account) & (cont_recom == 'WYOP')
		twitter_message.wait_until_present
		twitter_message.send_keys (twittermessage)
	end
	if ("P".in? account) & (cont_recom == 'WYOP')
		pinterest_message.wait_until_present
		pinterest_message.send_keys (pinterestmessage)
	end
	publication_name.to_subtype.clear
	#publication_name.send_keys (testcase)
	publication_name.send_keys ("Approval Workflow" + " - " + action + " - " + testcase)
	add_comment(action)

	if ("F".in? account)
	#Add Facebook Photo
		if media_library_0.visible? == true
			media_library_1.fire_event :click
		else
			media_library_0.fire_event :click
		end
		add_photo_qatesting(topic, subtopic)
	end
	#Add Twitter Photo
	if ("T".in? account)
		if media_library_0.visible? == true
			media_library_2.fire_event :click
		else
			media_library_1.fire_event :click
		end
		add_photo_qatesting(topic, subtopic)
	end
	#Add Pinterest Photo
	if ("P".in? account)
		if media_library_0.visible? == true
			media_library_3.fire_event :click
		else
			media_library_2.fire_event :click
		end
		add_photo_qatesting(topic, subtopic)
	end

	#Pinterest----------------------------
	if ("P".in? account)
		#pinterest_tag(pinteresttag)
		pinterest_board
	end
	#----------------------------

	submit_post.click

	publication_name.wait_while_present(360)
	table_loader.wait_while_present
end	

if (action == 'Edit')
	sleep 2
	#Filter out published posts
	#loading_spinner.wait_while_present
	#filter_for_scheduled
	loading_spinner.wait_while_present

	if "F".in? account
		facebook_action(facebookmessage).click
		sleep 1
		facebook_edit(facebookmessage).fire_event :click
	end
	if account == 'T'
		twitter_action(twittermessage).click
		sleep 1
		twitter_edit(twittermessage).wait_until_present
		twitter_edit(twittermessage).fire_event :click
	end
	if account == 'P'
		pinterest_action(pinterestmessage).click
		sleep 1
		pinterest_edit(pinterestmessage).wait_until_present
		pinterest_edit(pinterestmessage).fire_event :click
	end

	#submit_post.wait_until_present(360)
	sleep 1
	fleeting_notification.wait_while_present

	if ("F".in? account)
		add_newfacebookmessage(newfacebookmessage)
	end
	if ("T".in? account)
		add_newtwittermessage(newtwittermessage)
	end
	if ("P".in? account)
		add_newpinterestmessage(newpinterestmessage)
	end

	publication_name.to_subtype.clear
	#publication_name.send_keys (testcase)
	publication_name.send_keys ("Approval Workflow" + " - " + action + " - " + newtestcase)

	#add_comment(newtestcase)
	sleep 1
	submit_post_1.click

	publication_name.wait_while_present(360)
	table_loader.wait_while_present
end

if (action == 'Approve')
	#approve_post(facebookmessage)
	approve_post (/#{facebookmessage}/)
end

if (action == 'Reject')
	reject_post(facebookmessage)
end

table_loader.wait_while_present

sleep 2

open('results.csv', 'a') {|f|
f.puts ("#{filename}, #{result1}, #{action}, #{testcase}")
}
rescue Exception => e
	attempt += 1
	if attempt > 2
	open('results.csv', 'a') {|f|
	f.puts ("#{filename}, #{result2}, #{action}, #{testcase}, #{e}")
	@browser.iframe.screenshot.save ("Failed Approval" + " " + testcase + "  " + extension)
	}
	else
	@browser.iframe.close
		retry
	end
end   

#Close browser.iframe
@browser.iframe.close
end 