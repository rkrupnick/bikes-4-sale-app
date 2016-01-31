require 'rails_helper'

describe Order do

		it "is valid with a user, product, and price" do
			order = build(:order)
			expect(order).to be_valid
		end

		it "is valid without a user" do
			order = build(:order, user_id: nil)
			expect(order).to be_valid
		end

		it "is invalid without a product id" do
			order = build(:order, product_id: nil)
			expect(order).not_to be_valid
		end

		it "is invalid without a price" do
			order = build(:order, total: nil)
			expect(order).not_to be_valid
		end

		it "is invalid if price is not a number" do
			order = build(:order, total: "One")
			expect(order).not_to be_valid
		end
end