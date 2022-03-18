#-------------------------------
#Filename: CTAs.rb
#Author: Christopher De Lano
#Creation Date: 6-10-15
#Last Update - 9-22-16
#Version 4.8.1
#-------------------------------

require_relative 'spec_helper'

Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open 'PostTest.xls'
sheet1 = book.worksheet 1
sheet1.each 1 do |row|
fpic = rand(6)	
break if row [0].nil?
$column = row
cta = $column[0]
link = $column[1]
topic = $column[2]
subtopic = $column[3]
posttype = $column[4]


today = Date.today
current_day = "#{today.day}"
tomorrow = Date.current.tomorrow
next_day = "#{tomorrow.day + 2}" #Can add a " + x" to add more time, but it breaks down when trying to go to the following week
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
bnrocks.wait_until_present

bnrocks.click

close_publish_bar.click
view_publications

create.click

facebookmessage = ("CTA Testing: " + " " + posttype + " - " + cta )

sleep 1

facebook_message.wait_until_present
facebook_message.send_keys (facebookmessage)

publication_name.to_subtype.clear
publication_name.send_keys (posttype + " - " + cta)

#Add Link
add_link(link)

sleep 1

if posttype == "Carousel" 
	@browser.option(:label=> "Carousel").wait_until_present(180)
	@browser.option(:label=> "Carousel").click

	#First Pic
	add_photo_cta(topic, subtopic)
	sleep 2
	@browser.option(:text=> cta, :index=> 1).wait_until_present
	@browser.option(:text=> cta, :index=> 1).click
	@browser.input(:class=> 'multi-product-item-title', :index=> 0).send_keys cta

	sleep 1

	#Second Pic
	@browser.span(:class=> 'icon-arrow-right2', :index=> 1).click
	sleep 1
	add_photo_cta(topic, subtopic)
	sleep 2
	@browser.option(:text=> cta, :index=> 2).wait_until_present
	@browser.option(:text=> cta, :index=> 2).click
	@browser.input(:class=> 'multi-product-item-title', :index=> 1).send_keys cta

	sleep 1

	#Third Pic
	@browser.span(:class=> 'icon-arrow-right2', :index=> 1).click
	sleep 1
	add_photo_cta(topic, subtopic)
	sleep 2
	@browser.option(:text=> cta, :index=> 3).wait_until_present
	@browser.option(:text=> cta, :index=> 3).click
	@browser.input(:class=> 'multi-product-item-title', :index=> 2).send_keys cta

else posttype == "Single Link"
	#Add Title
	@browser.h4(:class=> 'link-title', :index=> 0).wait_until_present
	@browser.h4(:class=> 'link-title', :index=> 0).send_keys(cta)
	#Add Description
	@browser.p(:class=> 'link-description', :index=> 0).send_keys(cta)
	sleep 1
	@browser.div(:class=> 'js-link-cta').click
	@browser.option(:text=> cta).wait_until_present
	@browser.option(:text=> cta).click
	@browser.send_keys :escape
	#add_photo_cta(topic, subtopic)
end

#Set Scheduled Time
if posttype == "Carousel"
	calendar_icon.fire_event :click
	sleep 1
	#scheduled_time.hover
	scheduled_time.click
else
	schedule_publish 
	date_selector_0.send_keys "9:45 am"
	sleep 1
	#calendar_done_0.hover
	calendar_done_0.click
end
sleep 1
schedule_post_crud.click
schedule_post_publish.click

publication_name.wait_while_present(360)

#browser.screenshot.save ("Passed Create" + " " + testcase + " " + browsertype + " " + extension)

open('results.csv', 'a') {|f|
f.puts ("#{filename}, #{result1}, #{cta}")
}
rescue Exception => e
	attempt += 1
	if attempt > 2
	open('results.csv', 'a') {|f|
	f.puts ("#{filename}, #{result2}, #{cta}, #{e}")
	@browser.screenshot.save ("Failed Create" + " " + cta + "  " + extension)
	}
	else
	@browser.close
	retry
	end
end   

#Close Browser
@browser.close
end   