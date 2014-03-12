# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  blog_id      :integer
#  name         :string(255)
#  content      :text
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Article < ActiveRecord::Base
	attr_accessible :name, :content, :published_at
	
	# Just an example of scoped uniqueness
	# validates_uniqueness_of :email, scope: :tenant_id

	belongs_to :blog
	# Scoped
	default_scope { where(blog_id: Blog.current_id) }

end
