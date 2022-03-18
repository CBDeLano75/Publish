#------------------------------- 
#Filename: ml_crud.rb
#Author: Christopher De Lano
#Original File Creation Date: 2-10-16
#Refactor File Creation Date: 12-02-16
#Last Update - 12-02-16
#Version 1.0
#------------------------------- 
  
require_relative 'spec_helper' 

Spreadsheet.client_encoding = 'UTF-8'

book = Spreadsheet.open 'posttest.xls'

sleep 2

sheet1 = book.worksheet 2
sheet1.each 1 do |row|	
break if row [0].nil?
$column = row
action = $column[0]
browsertype = $column[1]
testcase = $column[2]
account = $column[3]
media_type = $column[4]
topic = $column[5]
subtopic= $column[6]
medialocation = $column[7]


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
type = 'Create'
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

message = ("Media Library - " + media_type)

if action=='Create'
		facebook_message.wait_until_present
		facebook_message.send_keys (message)
else action == 'Edit'
		facebook_message.wait_until_present
		facebook_message.send_keys ("Updated " + message)
end

sleep 1
publication_name.to_subtype.clear
publication_name.send_keys (media_type)


media_library_0.when_present.click

if action=='Create'
	new_ml_topic(topic)
	sleep 2
	new_ml_subtopic(subtopic)
	sleep 1
else action == 'Edit'
	all_media_topics.when_present.click
	@browser.span(:class=> 'ng-binding', :text=> topic).when_present.click
	all_media_subtopics.when_present.click
	@browser.span(:class=> 'ng-binding', :text=> subtopic).when_present.click
end

if action != 'Delete'
	if (media_type == 'Photo')
		add_to_library.click
		media_location.set(medialocation)
		sleep 2
		@browser.span(:class=> 'ng-binding', :text=> subtopic).wait_while_present
		sleep 2
	end

	#Video Post - Set to upload local media
	if (media_type == 'Video')
		add_to_library.click
		media_location.set(medialocation)
		sleep 2
		add_to_library.wait_while_present
		sleep 2
	end
	all_media_topics.when_present.click
	sleep 1
	@browser.span(:class=> 'ng-binding', :index=> 1, :text=> topic).click
	sleep 1
	all_media_subtopics.when_present.click
	sleep 1
	@browser.span(:class=> 'ng-binding', :index=> 1, :text=> subtopic).click
	save_new_ml.click
	@browser.span(:class=> 'ng-binding', :index=> 1, :text=> subtopic).wait_while_present
	sleep 2
	library_types.wait_until_present(180)
	library_types.click
	sleep 2
	if (media_type == 'Photo')
		photo_media.click
		f_pic.when_present.click
	end
	if (media_type == 'Video')
		video_media.when_present.click
		f_video.click 
	end

	#Set Scheduled Time
	schedule_publish
	date_selector_0.send_keys "9:05 am"
	#calendar_done_0.hover
	calendar_done_0.click
	@browser.scroll.to :top
	sleep 1
	schedule_post_crud.click
  	schedule_post_publish.click

	publication_name.wait_while_present(360)
end
sleep 1

if action == 'Delete'
	@browser.a(:class=> 'dropdown-toggle', :text=> topic).when_present.click
	sleep 1
	@browser.span(:class=> 'ng-binding', :text=> topic).element(:xpath => './following::button', :index=> 1).fire_event "click"
	delete_topic.wait_until_present(180)
	sleep 1
	@browser.screenshot.save (topic + " " + extension)
	delete_topic.click
	sleep 1
	delete_topic.wait_while_present
	sleep 1
end 
 
open('results.csv', 'a') {|f|
f.puts ("#{filename}, #{result1}, #{testcase}")
}
rescue Exception => e
	attempt += 1
	if attempt > 2
	open('results.csv', 'a') {|f|
	f.puts ("#{filename}, #{result2}, #{action}, #{testcase}, #{e}")
	@browser.screenshot.save ("FailedML Create" + " " + media_type + "  " + extension)
	}
	else
	@browser.close
		retry
	end
end   

#Close Browser
@browser.close
end 