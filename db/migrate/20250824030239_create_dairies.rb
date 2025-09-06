class CreateDairies < ActiveRecord::Migration[7.2]
  def change
    create_table :dairy do |f|
      f.string :title
      f.text :content
      
      f.timestamps
    end
  end
end
