require 'rails_helper'

describe User do
	it "is valid with a valid email and password" do
		user = build(:user)
		expect(user).to be_valid
	end

	it "is invalid without a valid email address" do
		user = build(:user, email: "not_an_email")
		expect(user).to_not be_valid
	end
end