class AddColumnProfileUrlToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :profile_url, :text
  end
end
