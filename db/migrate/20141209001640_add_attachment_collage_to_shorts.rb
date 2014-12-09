class AddAttachmentCollageToShorts < ActiveRecord::Migration
  def self.up
    change_table :shorts do |t|
      t.attachment :collage
    end
  end

  def self.down
    remove_attachment :shorts, :collage
  end
end
