require 'rails_helper'

describe Comment do

		it "is valid with a body, user, and product" do
			comment = build(:comment)
			expect(comment).to be_valid
		end

		it "is invalid without a body" do
			comment = build(:comment, body: "")
			expect(comment).to_not be_valid
		end

		it "is invalid without a user" do
			comment = build(:comment, user: nil)
			expect(comment).to_not be_valid
		end

		it "is invalid without a product" do
			comment = build(:comment, product: nil)
			expect(comment).to_not be_valid
		end

		it "is invalid if rating is not an integer" do
			comment = build(:comment, rating: "A")
			expect(comment).to_not be_valid
		end
end