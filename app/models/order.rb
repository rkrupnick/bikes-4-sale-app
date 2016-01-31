class Order < ActiveRecord::Base
	belongs_to :product
	belongs_to :user
	validates :product_id, presence: true
	validates :total, presence: true, numericality: { only_integer: true }
end