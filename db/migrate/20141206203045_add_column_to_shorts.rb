class AddColumnToShorts < ActiveRecord::Migration
  def change
  	add_column :shorts, :name, :text
  	add_column :shorts, :permalink, :text
  end
end
