class CreateShort < ActiveRecord::Migration
  def change
    create_table :shorts do |t|
    	t.integer :user_id
    	t.integer :picture_id
    end
  end
end
