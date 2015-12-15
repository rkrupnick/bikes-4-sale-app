class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
	validates :name, presence: true
	validates :description, presence: true

	def average_rating
		comments.average(:rating).to_f
	end
end
