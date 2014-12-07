class AddCollageToShort < ActiveRecord::Migration
	def change
		add_column :shorts, :collage, :text
	end
end
