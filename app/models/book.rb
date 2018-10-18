class Book < ApplicationRecord
	validates :title, presence: true

	belongs_to :author

  	has_many :sales
 	has_many :users

  	def stripe_amount
    	(price * 100).to_i
  	end
end
