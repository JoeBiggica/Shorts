class CreateImageVersions < ActiveRecord::Migration
	def change
		create_table :image_versions do |t|
			t.integer :picture_id
			t.text :image_url
		end
	end
end
