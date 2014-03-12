# == Schema Information
#
# Table name: blogs
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  subdomain             :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  layout_name           :string(255)
#  custom_layout_content :text
#

class Blog < ActiveRecord::Base
	attr_accessible :name, :subdomain, :layout_name, :custom_layout_content
	
	has_many :articles


	def self.current_id=(id)
  		Thread.current[:blog_id] = id
	end

	def self.current_id
		Thread.current[:blog_id]
	end
end
