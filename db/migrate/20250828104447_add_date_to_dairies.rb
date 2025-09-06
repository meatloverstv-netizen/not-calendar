class AddDateToDairies < ActiveRecord::Migration[7.2]
  def change
    add_column :dairies, :date, :date
  end
end
