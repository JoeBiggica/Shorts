class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.text :email
    	t.text :password_digest
    	t.timestamps
    end

    create_table :pictures do |t|
    	t.text :image_url
    	t.text :edited_image_url
    	t.text :date_taken
    	t.integer :user_id
    	t.timestamps
    end

  end
end
