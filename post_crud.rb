#-------------------------------  
#Filename: post_crud.rb 
#Author: Christopher De Lano
#Original File Creation Date: 6-10-15
#Refactor File Creation Date: 10-25-16
#Last Update - 11-18-16
#Version 1.0
#------------------------------- 

require_relative 'spec_helper' 

Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open 'posttest.xls'
sheet1 = book.worksheet 0
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
subtopic = $column[8]
published = $column[9]
publish_now = $column[10]
scheduled_delete = $column[11]
cta = $column[12]
link = $column[13]
description = $column[14]
title = $column[15]
targeting = $column[16]
country = $column[17]
language = $column[18]
facebooktag = $column[19]
twittertag = $column[20]
pinteresttag = $column[21]
cctag = $column[22]

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
attempt = 1
filename = File.basename(__FILE__)

begin

facebookmessage = (cont_recom + "-" + post_type + "- " + account)
twittermessage = (cont_recom + "-" + post_type + "- " + account)
pinterestmessage = (cont_recom + "-" + post_type + "- " + account)

newfacebookmessage = ("Updated "+ cont_recom + "-" + post_type + "- " + account)
newtwittermessage = ("Updated "+ cont_recom + "-" + post_type + "- " + account)
newpinterestmessage = ("Updated "+ cont_recom + "-" + post_type + "- " + account)

login_qatesting_admin
bnnorth.wait_until_present

#if clear_assets.visible? == true
#	clear_assets.click
#end

if "F".in? account
 	bnnorth.wait_until_present
	#bnnorth.click
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

close_publish_bar.click
sleep 30
#view_publications

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
	#publication_name.to_subtype.clear
	#publication_name.send_keys (testcase)
	#add_comment(action)
end

if (action == 'Edit')
	loading_spinner.wait_while_present
	filter_for_scheduled
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
	
	schedule_post.wait_until_present(360)
	sleep 1
	fleeting_notification.wait_while_present


	if ("F".in? account) & (cont_recom == 'WYOP')
		add_newfacebookmessage(newfacebookmessage)
	end
	if ("T".in? account) & (cont_recom == 'WYOP')
		add_newtwittermessage(newtwittermessage)
	end
	if ("P".in? account) & (cont_recom == 'WYOP')
		add_newpinterestmessage(newpinterestmessage)
	end

	publication_name.to_subtype.clear
	publication_name.send_keys (newtestcase)
	add_comment(action)
end

if (action == 'Create') || (action == 'Edit')
	#Add Photo
	if (post_type == 'Photo') & (cont_recom == 'WYOP')
		if ("F".in? account)
		#Add Facebook Photo
			if media_library_0.visible? == true
				media_library_1.fire_event :click
			else
				media_library_0.fire_event :click
			end
			add_photo_seasons(topic, subtopic)
		end
		#Add Twitter Photo
		if ("T".in? account)
			if media_library_0.visible? == true
				media_library_2.fire_event :click
			else
				media_library_1.fire_event :click
			end
			add_photo_seasons(topic, subtopic)
		end
		#Add Pinterest Photo
		if ("P".in? account)
			if media_library_0.visible? == true
				media_library_3.fire_event :click
			else
				media_library_2.fire_event :click
			end
			add_photo_seasons(topic, subtopic)
		end
	end	

	#Add Video
	if (post_type == 'Video') & (cont_recom == 'WYOP')
		media_library_0.fire_event :click
		add_video_seasons(topic, subtopic)
	end

	#Add PW
	if (cont_recom == 'PW')
		select_cr_pw
		sleep 1
	 	if (post_type == 'Text')
		 	select_cr_text.click
		elsif(post_type == 'Photo')
			select_cr_photo.wait_until_present
		 	select_cr_photo.click
		else (post_type == 'Video')
		 	select_cr_video.click
		end

		#add_cr_0.hover
		#add_cr_0.fire_event :click
		btn_add_post.fire_event :click

		if ("F".in? account)
			cr_facebook_message(action, facebookmessage, newfacebookmessage)
		end
		if ("T".in? account)
			cr_twitter_message(action, twittermessage, newtwittermessage)
		end
		if ("P".in? account)
			cr_pinterest_message(action, pinterestmessage, newpinterestmessage)
		end
	end
#end

#Add FITB
if (cont_recom == 'FITB')
	 if (post_type == 'Text')
	 	textfitb = rand(1)
	 	select_cr_fitb
		select_cr_text.click
		@browser.iframe.button(:class=> 'add-prewritten-post-button', :text=> "Compose", :index=> textfitb).fire_event :click
		@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "date").send_keys ("#{today}")
		@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "season").send_keys (subtopic)
	elsif(post_type == 'Photo')
		photofitb = rand(1)
	 	select_cr_fitb
		select_cr_photo.click
		@browser.iframe.button(:class=> 'add-prewritten-post-button', :text=> "Compose").fire_event :click
 		@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "blank").send_keys (subtopic)
		@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "city").send_keys ("Kendall")
	else (post_type == 'Video')
	 	select_cr_fitb
		select_cr_video.click
		@browser.iframe.button(:class=> 'add-prewritten-post-button', :text=> "Compose").fire_event :click
 		@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "date").send_keys ("#{today}")
		@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "season").send_keys (subtopic)
		@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "text").send_keys ("smiles!")
	end
	btn_add_post.click
	if ("F".in? account)
		cr_facebook_message(action, facebookmessage, newfacebookmessage)
	end
	if ("T".in? account)
		cr_twitter_message(action, twittermessage, newtwittermessage)
	end
	if ("P".in? account)
		cr_pinterest_message(action, pinterestmessage, newpinterestmessage)
	end
end

if (publish_now == 'No')
	schedule_publish
	if (cont_recom == 'WYOP')
		if (action == 'Create')
			date_selector_0.send_keys "1:30 am"
		else
			date_selector_0.send_keys "1:30 am"
		end
	elsif (cont_recom == 'PW')
		if (action == 'Create')
			date_selector_0.send_keys "1:30 am"
		else
			date_selector_0.send_keys "1:30 am"
		end
	else 
		if (action == 'Create')
			date_selector_0.send_keys "1:30 am"
		else
			date_selector_0.send_keys "1:30 am"
		end
	end
	sleep 1
	#calendar_done_0.hover
	calendar_done_0.click
end

#if(scheduled_delete == 'Yes')
#	delete_schedule
#end

#Facebook----------------------------
#if ("F".in? account)
  	#facebook_tag(facebooktag)
	#limited_audience(country, language)
	#facebook_targeting(targeting)
#end
#----------------------------
#Twitter----------------------------
#if ("T".in? account)
	#twitter_tag(twittertag)
	#if @browser.iframe.a(:class=> 'twitter-link').visible? & (post_type == 'Photo')
	#	twitter_link.hover
	#	sleep 1
	#	twitter_link.fire_event :click
	#end
#end
#----------------------------
#Pinterest----------------------------
if ("P".in? account)
	#pinterest_tag(pinteresttag)
	pinterest_board
end
#----------------------------

#cc_tag(cctag)

#if (published == 'Yes')
#	unpublished_posts.click
#end

#if ("F".in? account) & (post_type != "Video")
#	add_link(link)
#	if (link_title.visible? == true)
#		facebook_link(title, description, cta)
#	end
#end

#if (action == "Edit") & ("F".in? account) & (post_type != "Video")
#	edit_link(link)
#	facebook_link(title, description, cta)
#end

if (publish_now == 'No')
	@browser.scroll.to :top
	sleep 1
	if (action == "Create")
		schedule_post_crud.click
		if ("F".in? account)
  			schedule_post_publish.click
  		end
	else
		schedule_post.click
	end
	sleep 1
	cross_tag.wait_while_present(180)

else
	@browser.scroll.to :top
	publish_post.fire_event :click
	publish_post.wait_while_present(360)
end

#fleeting_notification.wait_while_present(360)
publication_name.wait_while_present(360)
table_loader.wait_while_present
end

if (action == 'Delete')
	loading_spinner.wait_while_present
	filter_for_scheduled
	loading_spinner.wait_while_present
	#works up to here
	if "F".in? account
		facebook_action(facebookmessage).click
		sleep 1
		facebook_delete(facebookmessage).click
	end
	if account == 'T'
		twitter_action(twittermessage).click
		sleep 1
		twitter_delete(twittermessage).click
	end
	if ("P".in? account)
		pinterest_action(pinterestmessage).click
		sleep 1
		pinterest_delete(pinterestmessage).click
	end
	sleep 1
	confirm_post_delete.wait_until_present
	sleep 1
	confirm_post_delete.fire_event :click
	confirm_post_delete.wait_while_present
	table_loader.wait_while_present
end

open('post_results.csv', 'a') {|f|
f.puts ("#{filename}, #{result1}, #{action}, #{testcase}")
}
rescue Exception => e
	attempt += 1
	if attempt > 2
	open('post_results.csv', 'a') {|f|
	f.puts ("#{filename}, #{result2}, #{action}, #{testcase}, #{e}")
	@browser.screenshot.save ("Failed" + " " + action + " " + testcase + "  " + extension)
	#end
	}
	else
		@browser.quit
		retry
	end
end  
@browser.close()
@browser.quit()
end