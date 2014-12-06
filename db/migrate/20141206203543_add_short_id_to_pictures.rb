class AddShortIdToPictures < ActiveRecord::Migration
  def change
  	remove_column :shorts, :picture_id
  	add_column :pictures, :short_id, :integer
  end
end
