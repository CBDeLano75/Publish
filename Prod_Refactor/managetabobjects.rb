#-------------------------------  
#Filename: manageobjects.rb
#Author: Christopher De Lano
#File Creation Date: 10-25-16
#Last Update - 11-18-16
#Version 1.0
#-------------------------------

def search_assets
	@browser.iframe.input(:class=> 'search-input')
end

def clear_assets
	@browser.iframe.button(:class=> 'remove-all-selections', :text=> "Remove All")
end

def bneast
	@browser.iframe.span(:class=>'asset-name', :text=> "BN East")
end

def bnnorth
	@browser.iframe.span(:class=>'asset-name', :text=> "BN North")
end

def bnrocks
	@browser.iframe.span(:class=>'asset-name', :text=> "BN.rocks")
end

def bnnorthchild0
	@browser.iframe.span(:class=> 'asset-name', :text=> "BNNorthChild0")
end

def bnnorthchild1
	@browser.iframe.span(:class=> 'asset-name', :text=> "BNNorthChild1")
end

def bnnorthchild2
	@browser.iframe.span(:class=> 'asset-name', :text=> "BNNorthChild2")
end

def bnnorthchild3
	@browser.iframe.span(:class=> 'asset-name', :text=> "BNNorthChild3")
end

def pin_FocusedPrime
	@browser.iframe.span(:class=> 'asset-name', :text=> "FocusedPrime")
end

def pin_jgruebnco
	@browser.iframe.span(:class=> 'asset-name', :text=> "jgruebnco")
end

def pin_kruchone
	@browser.iframe.span(:class=> 'asset-name', :text=> "kruchone")
end

def pin_josh5947
	@browser.iframe.span(:class=> 'asset-name', :text=> "josh5947")
end

def close_publish_bar
	@browser.iframe.button(:class=> 'close-publish-bar')
end

def view_posts
	@browser.iframe.a(:text=> "Posts")
end

def view_publications
	@browser.iframe.a(:text=> "Publications")
end

#Filter-----------------------------
def filter_modal
	@browser.iframe.button(:class=> 'icon-filter')
end

def filter_published
	@browser.iframe.div(:class=> 'col-xs-4', :index=> 1).div(:class=> 'custom-checkbox')
end

def filter_scheduled
	@browser.iframe.div(:class=> 'col-xs-4', :index=> 2).div(:class=> 'custom-checkbox')
end

def filter_draft
	@browser.iframe.div(:class=> 'col-xs-4', :index=> 3).div(:class=> 'custom-checkbox')
end

def filter_pending
	@browser.iframe.div(:class=> 'col-xs-4', :index=> 4).div(:class=> 'custom-checkbox')
end

def filter_deleted
	@browser.iframe.div(:class=> 'col-xs-4', :index=> 5).div(:class=> 'custom-checkbox')
end

def filter_error
	@browser.iframe.div(:class=> 'col-xs-4', :index=> 6).div(:class=> 'custom-checkbox')
end

def filter_rejected
	@browser.iframe.div(:class=> 'col-xs-4', :index=> 7).div(:class=> 'custom-checkbox')
end

def filter_myposts
	@browser.iframe.div(:class=> 'first-row').div(:class=> 'col-xs-5').div(:class=> 'custom-checkbox')
end

def filter_apply
	@browser.iframe.button(:text=> "Apply")
end

def icon_spinner
	@browser.iframe.span(:class => 'icon-spinner2')
end

def table_loader
	@browser.iframe.span(:text=> "Loading...")
end

def search_icon
	@browser.iframe.button(:class=> 'icon-search3')
end

def search_box
	@browser.iframe.input(:class=> 'search-box')
end

def bulk_checkbox
	@browser.iframe.div.table.thead.tr.th(:class=> 'text-center').div(:class=> 'custom-checkbox')
end

def bulk_select
	@browser.iframe.div.table.thead.tr.th(:class=> 'text-center').div(:class=> 'custom-checkbox').parent.input(:type=> 'checkbox')
end

def filter_delete
	@browser.iframe.button(:class=> 'filter-header-button', :index=> 1)
end

def confirm_delete
	@browser.iframe.button(:text=> "Delete")
end

def facebook_action(facebookmessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{facebookmessage}/).element(:xpath => './following::button', :index=> 0)
end

def twitter_action(twittermessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{twittermessage}/).element(:xpath => './following::button', :index=> 0)
end

def pinterest_action(pinterestmessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{pinterestmessage}/).element(:xpath => './following::button', :index=> 0)
end

def facebook_edit(facebookmessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{facebookmessage}/).element(:xpath => './following::ul').li(:index=> 1).a.span(:class=> 'icon-pencil5')
end

def twitter_edit(twittermessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{twittermessage}/).element(:xpath => './following::ul').li(:index=> 1).a.span(:class=> 'icon-pencil5')
end

def pinterest_edit(pinterestmessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{pinterestmessage}/).element(:xpath => './following::ul').li(:index=> 1).a.span(:class=> 'icon-pencil5')
end

def facebook_delete(facebookmessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{facebookmessage}/).element(:xpath => './following::ul').li(:index=> 3).button.span(:class=> 'icon-remove8')
end

def twitter_delete(twittermessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{twittermessage}/).element(:xpath => './following::ul').li(:index=> 3).button.span(:class=> 'icon-remove8')
end

def pinterest_delete(pinterestmessage)
	@browser.iframe.span(:class=> 'message-text', :text=> /#{pinterestmessage}/).element(:xpath => './following::ul').li(:index=> 2).button.span(:class=> 'icon-remove8')
end

def confirm_post_delete
	@browser.iframe.button(:class=> 'btn-danger', :text=> "Delete")
end

def create
	@browser.iframe.a(:text=>"Create")
end

def got_it
	@browser.iframe.button(:class=> 'btn-primary', :text=> "Got It!")
end


#Approval-----------------------------
def approval_icon 
	@browser.iframe.span(:class=> 'approve-popover-trigger-icon')
end

def approve_menu
	@browser.iframe.div(:class=> 'approval-item-actions', :index=> 0)
end

def approve_facebook(facebookmessage)
	#@browser.iframe.div(:text=> facebookmessage)
	@browser.iframe.div(:class=> 'approval-item-message', :text=> facebookmessage)
end

def approve_checkmark
	#@browser.iframe.div(:class=> 'approval-item-actions', :index=> 0).span(:class=> 'icon-checkmark')
	@browser.iframe.div(:class=> 'approval-item-body').div(:class=> 'approval-item-actions').span(:class=> 'dropdown').ul.li.a.span(:class=> 'icon-checkmark').click
end

def reject_blocked
	@browser.iframe.div(:class=> 'approval-item-actions', :index=> 0).span(:class=> 'icon-blocked')
end

def edit_approval
	@browser.iframe.div(:class=> 'approval-item-actions', :index=> 0).span(:class=> 'icon-custom-glasses')
end

def approve_post
	@browser.iframe.button(:text => "Approve")
end






















