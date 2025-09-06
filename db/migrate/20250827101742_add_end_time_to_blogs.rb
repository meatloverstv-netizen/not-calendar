class AddEndTimeToBlogs < ActiveRecord::Migration[7.2]
  def change
    add_column :blogs, :end_time, :datetime
  end
end
