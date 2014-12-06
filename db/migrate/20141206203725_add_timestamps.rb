class AddTimestamps < ActiveRecord::Migration
  def change
    add_column :shorts, :created_at, :datetime
    add_column :shorts, :updated_at, :datetime
  end
end
