class CreateAuthors < ActiveRecord::Migration[5.2]
	def change
    	create_table :authors do |t|
    		t.string :title, null: false

  			t.timestamps
  		end
    end
end
