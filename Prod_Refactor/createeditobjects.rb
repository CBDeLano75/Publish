 #------------------------------- 
#Filename: createeditobjects.rb 
#Author: Christopher De Lano
#File Creation Date: 10-25-16
#Last Update - 11-18-16 
#Version 1.0 
#-------------------------------


def facebook_message
	@browser.iframe.p(:class=> 'post-message', :index=> 0)
end

def twitter_message
	@browser.iframe.p(:class=> 'post-message', :index=> 1)
end

def pinterest_message
	@browser.iframe.p(:class=> 'post-message', :index=> 3)
end

def publication_name
	@browser.iframe.input(:id=> 'create-publication-name')
end

#Media Library-----------------------------
def media_library_0
	@browser.iframe.button(:class => 'choose-from-media-library', :index=>0, :text => "Media Library")
end

def media_library_1
	@browser.iframe.button(:class => 'choose-from-media-library', :index=>1, :text => "Media Library")
end

def media_library_2
	@browser.iframe.button(:class => 'choose-from-media-library', :index=>2, :text => "Media Library")
end

def media_library_3
	@browser.iframe.button(:class => 'choose-from-media-library', :index=>3, :text => "Media Library")
end

def library_types
	@browser.iframe.a(:class=> 'dropdown-toggle', :text=> "All Media Types")
end

def photo_media
	@browser.iframe.span(:class=> 'ng-binding', :text=> "Photos")
end

def video_media
	@browser.iframe.span(:class=> 'ng-binding', :text=> "Video")
end

def all_topics
	@browser.iframe.a(:class=> 'dropdown-toggle', :text=> "All Topics")
end

def all_media_topics
	@browser.iframe.a(:class=> 'dropdown-toggle', :text=> "All Topics", :index=> 0)
end

#def topic_select
#	@browser.iframe.span(:class=> 'ng-binding', :text=> topic)
#end

def all_media_subtopics
	@browser.iframe.a(:class=> 'dropdown-toggle', :text=> "All Subtopics", :index=> 0)
end

def f_pic
	@browser.iframe.button(:class=> 'add-media-item-button', :text => "Add Photo", :index=> 0)
end

def t_pic
	@browser.iframe.button(:class=> 'add-media-item-button', :text => "Add Photo", :index=> 1)
end

def p_pic
	@browser.iframe.button(:class=> 'add-media-item-button', :text => "Add Photo", :index=> 2)
end

def f_video
	@browser.iframe.button(:class=> 'add-media-item-button', :text => "Add Video", :index=> 0)
end

#Content Recommendations-----------------------------
def select_cr
	@browser.iframe.button(:class=> 'browse-prewritten-content-button')
end

def select_type
	@browser.iframe.a(:class=> 'dropdown-toggle', :index=> 0, :text=> "All Post Types")
end

def select_pw
	@browser.iframe.a(:class=> 'pull-left', :text=> "Pre-Written")
end

def select_fitb
	@browser.iframe.a(:class=> 'pull-left', :text=> "Fill-in-the-Blank")
end

def select_cr_topic
	@browser.iframe.a(:class=> 'dropdown-toggle', :text=> "All Topics")
end

def select_cr_qatest
	@browser.iframe.a(:class=> 'pull-left', :text=> "QATest")
end

def all_subtopics
	@browser.iframe.a(:class=> 'dropdown-toggle', :text=> "All Subtopics")
end

def select_cr_text
	#@browser.iframe.a(:class=> 'pull-left', :text=> "Text")
	@browser.iframe.a(:text=> "Text")
end

def select_cr_photo
	#@browser.iframe.a(:class=> 'pull-left', :text=> "Photos")
	@browser.iframe.a(:text=> "Photos")
end

def select_cr_video
	#@browser.iframe.a(:class=> 'pull-left', :text=> "Videos")
	@browser.iframe.a(:text=> "Videos")
end

def add_cr_0
	@browser.iframe.button(:class=> 'add-prewritten-post-button', :text=> "Add Post", :index=> 0)
end

def compose_fitb
	@browser.iframe.button(:class=> 'add-prewritten-post-button', :text=> "Compose", :index=> 0)
end

def add_date
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "date")
end

def add_season
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "season")
end

def add_blank
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "blank")
end

def add_city
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "city")
end

def add_text
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "text")
end

def add_blank1
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "blank1")
end

def add_blank2
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "blank2")
end

#New Media Library Topic Subtopic-----------------------------
def add_topic
	@browser.iframe.a(:class=> 'dropdown-toggle', :index=> 1, :text=> "All Topics")
end

def create_ml_topic
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 0)
end

def new_ml_topic_name
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 0).parent.input(:class=>'pull-left')
end

def new_ml_topic_description
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 0).parent.input(:class=>'description-input')
end

def save_new_ml_topic
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 0).parent.button(:class=>'save-item-button')
end

def create_ml_subtopic
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 1)
end

def new_ml_subtopic_name
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 1).parent.input(:class=>'pull-left')
end

def new_ml_subtopic_description
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 1).parent.input(:class=>'description-input')
end

def save_new_ml_subtopic
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 1).parent.button(:class=>'save-item-button')
end

def create_cr_topic
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 2)
end

def new_cr_topic_name
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 2).parent.input(:class=>'pull-left')
end

def new_cr_topic_description
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 2).parent.input(:class=>'description-input')
end

def save_cr_topic
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 2).parent.button(:class=>'save-item-button')
end	

def create_cr_subtopic
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 3)
end

def new_cr_subtopic_name
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 3).parent.input(:class=>'pull-left')
end

def new_cr_subtopic_description
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 3).parent.input(:class=>'description-input')
end

def save_cr_subtopic
	@browser.iframe.a(:class=> 'add-item-prompt', :index=> 3).parent.button(:class=>'save-item-button')
end	

def create_pw_message
	@browser.iframe.p(:class=>'post-message',:index=> 4)
end

def new_cr_tag
	@browser.iframe.input(:class=> 'input', :index=> 4, :placeholder => "Enter a tag name...")
end

def new_pw_link
	@browser.iframe.input(:id=> 'create-post-link', :index=> 1)
end

def media_location
	@browser.iframe.file_field(:type=>'file', :index=> 3)
end

def media_loader
	@browser.iframe.div(:class=> 'progress-bar', :index=> 3)
end

def new_fitb_message
	@browser.iframe.p(:class=>'fitb-post-message')
end

def new_fitb_blank
	@browser.iframe.button(:class=> 'insert-generic-blank')
end

def create_preset
	@browser.iframe.input(:placeholder=> 'Add preset FITB...')
end

def add_preset
	@browser.iframe.button(:class=> 'btn-primary', :value=> 'Add')
end

def select_preset
	@browser.iframe.span(:class=> 'text', :text=> "{blank2}")
end

def save_cr
	@browser.iframe.button(:class=>'btn-primary', :text=>"Save")
end

def save_new_ml
	@browser.iframe.button(:class=>'btn-primary', :text=>"Save", :index=> 0)
end

#Link-----------------------------
def link_address
	@browser.iframe.input(:id=> 'create-post-link', :index=> 0)
end

def cr_link_address
	@browser.iframe.input(:id=> 'create-post-link', :index=> 1)
end

def link_title
	@browser.iframe.h4(:class=> 'link-title', :index=> 0)
end

def link_description
	@browser.iframe.p(:class=> 'link-description', :index=> 0)
end

def cta_dropdown
	@browser.iframe.div(:class=> 'js-link-cta')
end
#-----------------------------

def carousel
	@browser.iframe.option(:label=> "Carousel")
end

#how to pass variable
def set_cta_0
	@browser.iframe.option(:text=> cta, :index=> 0)
end

def set_cta_1
	@browser.iframe.option(:text=> cta, :index=> 1)
end

def set_cta_2
	@browser.iframe.option(:text=> cta, :index=> 2)
end

def set_cta_3
	@browser.iframe.option(:text=> cta, :index=> 3)
end

def multi_prod_0
	@browser.iframe.input(:class=> 'multi-product-item-title', :index=> 0)
end

def multi_prod_1
	@browser.iframe.input(:class=> 'multi-product-item-title', :index=> 1)
end

def multi_prod_2
	@browser.iframe.input(:class=> 'multi-product-item-title', :index=> 2)
end

#Publish Schedule-----------------------------
def publish_now
	@browser.iframe.input(:value=> "Publish Now")
end

def calendar_icon
	@browser.iframe.span(:class=> 'icon-calendar2')
end

def scheduled_time
	@browser.iframe.a(:text=>"Scheduled Time")
end

def publish_schedule
	@browser.iframe.input(:id=> 'create-schedule')
end

def date_selector_0
	@browser.iframe.input(:placeholder=>"Pick a date first", :index=> 0)
end

def date_selector_1
	@browser.iframe.input(:placeholder=>"Pick a date first", :index=> 1)
end

def calendar_done_0
	@browser.iframe.button(:class=>'bn-calendar-done', :index=> 0)
end

def calendar_done_1
	@browser.iframe.button(:class=>'bn-calendar-done', :index=> 1)
end
#Delete Schedule-----------------------------
def delete_checkbox
	@browser.iframe.input(:id, 'scheduled-delete-checkbox').parent.element(:class=> 'icon-checkmark')
end

def delete_schedule
	@browser.iframe.input(:id=> 'delete-schedule')
end

#Facebook Config
#Limited Audience-----------------------------
def la_icon
	@browser.iframe.span(:class=> 'icon-eye')
end

def country_input
	@browser.iframe.input(:class=>'input', :placeholder=> "Select countries (max 25)...")
end

def select_country
	@browser.iframe.li(:class=> 'suggestion-item', :text=> "United States")
end

def language_input
	@browser.iframe.input(:class=>'input', :placeholder=> "Select languages...")
end

def select_language
	@browser.iframe.li(:class=> 'suggestion-item', :text=> "English")
end

def close_la
	@browser.iframe.span(:class=> 'icon-close', :index=> 0)
end

#Targeting-----------------------------
def target_icon
	@browser.iframe.span(:class=> 'icon-target')
end

def la_button
	@browser.iframe.button(:class=> 'btn-link', :text=> "Load Audience")
end

def select_audience
	@browser.iframe.td(:class=> 'ng-binding', :text=> "QATesting_v1")
end

def select_QATesting_v2
	@browser.iframe.td(:class=> 'ng-binding', :text=> "QATesting_v2")
end

def load_audience
	@browser.iframe.button(:class=> 'btn-primary', :text=> "Load Audience")
end

def close_target
	@browser.iframe.span(:class=> 'icon-close', :index=> 1)
end

#Facebook Tag-----------------------------
def ftag_icon
	@browser.iframe.span(:class=> 'icon-tag4', :index=> 0)
end

def ftag
	@browser.iframe.input(:class=> 'input', :index=> 1, :placeholder => "Enter a tag name...")
end

#Twitter Config-----------------------------
def ttag_icon
	@browser.iframe.span(:class=> 'icon-tag4', :index=> 1)
end

def ttag
	@browser.iframe.input(:class=> 'input', :index=> 2, :placeholder => "Enter a tag name...")
end

def twitter_link
	@browser.iframe.div(:class=> 'twitter-preview-header').div(:class=> 'post-detail').div(:class=>'link-preview-link').button(:class=>'icon-close')
end

#Pinterest Config-----------------------------
def ptag_icon
	@browser.iframe.span(:class=> 'icon-tag4', :index=> 2)
end

def ptag
	@browser.iframe.input(:class=> 'input', :index=> 3, :placeholder => "Enter a tag name...")
end

def pinterest_footer
	@browser.iframe.div(:class=> 'pinterest-preview-footer').button(:class=> 'btn-link')
end

def pinterest_board_name
	@browser.iframe.span(:class=>'board-name')
end

def pinterest_board_description
	@browser.iframe.div(:class=>'select-boards-option-description', :index=>1)
end

def button_done
	@browser.iframe.button(:class=> 'btn-primary', :text=> "Done")
end

#CC Tag-----------------------------
def cross_tag
	@browser.iframe.input(:class=> 'input', :index=> 0, :placeholder => "Enter a tag name...")
end

#-----------------------------
def save_changes
	@browser.iframe.button(:class=> 'btn-success').span(:text => "Save Changes")
end

def schedule_post
	@browser.iframe.button(:class=> 'btn-success').span(:text => "Schedule")
end

def schedule_post_crud
	@browser.iframe.button(:class=> 'btn-success', :text => "Schedule")
end

def schedule_post_publish
	@browser.iframe.a(:text => "Schedule in Publish")
end

def publish_post
	@browser.iframe.button(:text => "Publish")
end

def submit_post
	@browser.iframe.button(:text => "Submit")
end

def submit_post_1
	@browser.iframe.span(:text => "Submit")
end

def draft_post
	@browser.iframe.button(:class=> 'post-action-button', :text=> "Save as Draft")
end

def post_action_button
	@browser.iframe.button(:class=> 'post-action-button', :index=> 1)
end

def add_to_library
	@browser.iframe.button(:class=> 'add-to-library-button', :index=> 0)
end

def delete_topic
	@browser.iframe.span(:class=> 'ng-binding', :text=> topic).element(:xpath => './following::button', :index=> 1)
end

#Comments-----------------------------
def comment_bubble
	@browser.iframe.span(:class=> 'icon-bubble2')
end

def comment_text
	@browser.iframe.textarea(:class=> 'form-control')
end

def comment_add
	@browser.iframe.button(:class=> 'comments-list-form-submit', :text=> "Add")
end
#-----------------------------

def unpublished_posts
	@browser.iframe.input(:class=> 'switch-checkbox')
end

def fleeting_notification
	@browser.iframe.div(:class=> 'fleeting-notification')
end

def btn_add_post
	@browser.iframe.button(:class=> 'btn-success', :text=> "Add Post")
end

def loading_spinner
	@browser.iframe.span(:class => 'icon-spinner2')
end

def remove_object
	@browser.iframe.button(:text=> "Remove Link Object")
end

#New PW Topic-----------------------------
def add_cr
	@browser.iframe.button(:class=>'add-content-button')
end

def new_pw
	@browser.iframe.a(:text=>"Pre-written Post")
end

def add_subtopic
	@browser.iframe.a(:class=> 'dropdown-toggle', :index=> 1, :text=> "All Subtopics")
end

def cta_learn_more
	@browser.iframe.option(:text=> "Learn More")
end

def new_cr_spinner
	@browser.iframe.span(:class=> 'icon-spinner2')
end

def new_fitb
	@browser.iframe.a(:text=>"Fill-in-the-Blank Post")
end

def fitb_blank
	@browser.iframe.p(:class=>'fitb-post-message')
end

def add_new_preset
	@browser.iframe.input(:placeholder=> 'Add preset FITB...')
end

def fitb_blank1
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "blank1")
end

def fitb_blank2
	@browser.iframe.input(:class=> 'dark-textfield', :placeholder=> "blank2")
end

def add_new_cr_post
	@browser.iframe.button(:class=> 'add-prewritten-post-button', :text=> "Add Post", :index=>0)
end

def edit_cr
	@browser.iframe.span(:class=> 'icon-pencil5')
end

def edit_cr_message
	@browser.iframe.p(:class=>'post-message',:index=> 4)
end

def delete_topic
	@browser.iframe.button(:class=> 'btn-danger', :text=> "Delete")
end

def create_content_cancel
	@browser.iframe.button(:class=> 'btn-defaul', :text => "Save")
end

def cta_media
	@browser.iframe.button(:class => 'btn-link', :index=>1, :text => "Media Library")
end