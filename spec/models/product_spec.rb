require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before do
			@product = build(:product)
			@user1 = build(:user, email: "admin@example.com")
			@user2 = build(:user, email: "anotheruser@example.com")
			comment = create(:comment, product: @product)
			comment3 = create(:comment, rating: 3, product: @product, user: @user1)
			comment5 = create(:comment, rating: 1, product: @product, user: @user2)
		end

		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end
	end

	context "when the product has a description but no name" do
		before do
			@product = build(:product, name: "")
		end

		it "is invalid" do
			expect(@product).not_to be_valid
		end
	end
end
