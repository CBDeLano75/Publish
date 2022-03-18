#-------------------------------   
#Filename: cr_crud.rb
#Author: Christopher De Lano
#Original File Creation Date: 2-10-16
#Refactor File Creation Date: 11-05-16
#Last Update - 11-29-16
#Version 1.0 
#-------------------------------

require_relative 'spec_helper' 

Spreadsheet.client_encoding = 'UTF-8'

book = Spreadsheet.open 'posttest.xls'

sleep 2

sheet1 = book.worksheet 3
sheet1.each 1 do |row|	
break if row [0].nil?
$column = row
action = $column[0]
browser.iframe.iframetype = $column[1]
testcase = $column[2]
account = $column[3]
post_type = $column[4]
cont_recom = $column[5]
topic = $column[6]
subtopic= $column[7]
blank1 = $column[8]
blank2 = $column[9]
medialocation = $column[10]
link = $column[11]
newtestcase = $column[12]

today = Date.today
current_day = "#{today.day}"
tomorrow = Date.current.tomorrow
next_day = "#{tomorrow.day + 2}" #Can add a " + x" to add more time, but it breaks down when trying to go to the following week
current = DateTime.now
month = current.month
time = Time.new
time = (time.hour.to_s + ":" + time.min.to_s)
result1 = 'Pass'
result2 = 'Fail'
extension = '.png'
link_prefix = 'https://'
attempt = 1
filename = File.basename(__FILE__)
 
begin
login_qatesting_admin
bnnorth.wait_until_present

if clear_assets.visible? == true
	clear_assets.click
end

bnnorth.wait_until_present
bnrocks.click

create.click

facebookmessage = (cont_recom  + " Library " + "-" + post_type)
newfacebookmessage = (cont_recom  + " Library " + "-" + post_type)
new_pw_cr_message = (post_type + " " + cont_recom + "  ")
new_fitb_cr_message = (post_type + " " + cont_recom + "  ")
updated_pw_cr_message = ("Updated " + post_type + " " + cont_recom + "  ")
updated_fitb_cr_message = ("Updated " + post_type + " " + cont_recom + "  ")


facebook_message.wait_until_present
#facebook_message.send_keys (facebookmessage)

#Create Content Recommendations
if (action == "Create")
	add_content
	if (cont_recom == 'Pre-Written')
		new_pw.when_present.click
		#Create Topics and Subtopics
		new_cr_topic(topic)
		new_cr_subtopic(subtopic)
		#Add Message
		new_pw_message(new_pw_cr_message)
	else (cont_recom == 'FITB')
		new_fitb.when_present.click
		#Create Topics and Subtopics
		new_cr_topic(topic)
		new_cr_subtopic(subtopic)
		#Add Message
		new_fitb_message(new_fitb_cr_message)
	end
	#Add Tag
	new_cr_tag.wait_until_present
	new_cr_tag.send_keys(testcase)
	new_cr_tag.send_keys :tab
	sleep 1
	#Add Link
	if (post_type != 'Video')
		new_cr_link(link)
	end
	#Text Post
		#na
	#Media Post - Set to upload local media
	if (post_type == 'Photo') || (post_type == 'Video')
		media_location.set(medialocation)
		sleep 2
		media_loader.wait_while_present
		#browser.iframe.iframe.screenshot.save ("New PW " + testcase + " " + extension)
	end
	save_cr.fire_event :click
	new_cr_spinner.wait_while_present(180)
end

#Edit Content Recommendations-----------------------
if (action == "Edit")
	if (cont_recom == 'Pre-Written')
		edit_pw_cr(topic, subtopic)
		sleep 1
		edit_pw_message(updated_pw_cr_message)
	elsif (cont_recom == 'FITB')
		edit_fitb_cr(topic, subtopic)
		sleep 1
		edit_fitb_message(updated_fitb_cr_message)
	end	
	#Add Tag
	new_cr_tag.wait_until_present
	new_cr_tag.send_keys(testcase)
	new_cr_tag.send_keys :tab

	if (post_type != 'Video')
		edit_cr_link(link)
	end
	if (post_type == 'Photo') || (post_type == 'Video')
		media_location.set(medialocation)
		sleep 2
		media_loader.wait_while_present
	end
	save_cr.fire_event :click
	create_content_cancel.wait_while_present(180)	
end

#Compose Messages
if (action == "Create")
	if (cont_recom == 'Pre-Written')
		select_new_pw_cr(topic, subtopic)
	else (cont_recom == 'FITB')
		select_new_fitb_cr(topic, subtopic)
		add_blank1.send_keys (" " + current_day)
		add_blank2.send_keys (" " + blank2)
		btn_add_post.when_present.click
	end
elsif (action == "Edit")
	if (cont_recom == 'Pre-Written')
		sleep 1
		add_new_cr_post.fire_event "click"
	else (cont_recom == 'FITB')
		sleep 1
		compose_fitb.fire_event "click"
		add_blank1.send_keys (" " + next_day)
		add_blank2.send_keys (" " + blank2)
		btn_add_post.when_present.click
	end
end

if (action == "Create") || (action == "Edit")
	publication_name.to_subtype.clear
	publication_name.send_keys (testcase)
	cr_facebook_message(action, facebookmessage, newfacebookmessage)

	calendar_icon.fire_event :click
	sleep 1
	#scheduled_time.hover
	scheduled_time.click
	sleep 1
	schedule_post_crud.click
  	schedule_post_publish.click

	publication_name.wait_while_present(360)
	#table_loader.wait_while_present
	#icon_spinnet.wait_while_present
end

if (action == "Delete")
	select_cr.wait_until_present(180)
	select_cr.click
	all_topics.wait_until_present(180)
	all_topics.click
	@browser.iframe.iframe.span(:class=> 'ng-binding', :text=> topic).when_present.click
	sleep 1
	@browser.iframe.iframe.span(:class=> 'ng-binding', :text=> topic).element(:xpath => './following::button', :index=> 1).fire_event "click"
	delete_topic.wait_until_present(180)
	sleep 1
	delete_topic.click
	sleep 1
	delete_topic.wait_while_present
	sleep 1
	#browser.iframe.iframe.refresh
	select_cr.wait_until_present(180)
end

open('results.csv', 'a') {|f|
	if (action == 'Edit')
		f.puts ("#{filename}, #{result1}, #{action}, #{newtestcase}")
	else
		f.puts ("#{filename}, #{result1}, #{action}, #{testcase}")
	end
}
rescue Exception => e
	attempt += 1
	if attempt > 2
	open('results.csv', 'a') {|f|
		if (action == 'Edit')
			f.puts ("#{filename}, #{result2}, #{action}, #{testcase} , #{e}")
			@browser.iframe.iframe.screenshot.save ("Failed Edit" + " " + testcase + "  " + extension)
		elsif (action == 'Create')
			f.puts ("#{filename}, #{result2}, #{action}, #{testcase}, #{e}")
			@browser.iframe.iframe.screenshot.save ("Failed Create" + " " + testcase + "  " + extension)
		else
			f.puts ("#{filename}, #{result2}, #{action}, #{testcase}, #{e}")
			@browser.iframe.iframe.screenshot.save ("Failed Delete" + " " + testcase + "  " + extension)

		end
	}
	else
		@browser.iframe.iframe.close
		retry
	end
end  
#Close browser.iframe.iframe
@browser.iframe.iframe.close
end   