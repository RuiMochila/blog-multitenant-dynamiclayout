class AddLayoutToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :layout_name, :string
    add_column :blogs, :custom_layout_content, :text
  end
end
