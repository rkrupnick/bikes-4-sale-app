require 'rails_helper'

describe Order do

		it "is valid" do
			order = build(:order)
			expect(order).to be_valid
		end
end