require "rails_helper"

RSpec.feature "Product management", :type => :feature do 
	scenario "Add new product" do
		visit "/products/new"

		fill_in "Name", :with => "New Product"
		fill_in "Price", :with => 200
		fill_in "Description", :with => "A description"
		fill_in "Image url", :with => "image.jpg"
		fill_in "Color", :with => "Green"

		click_button "Create Product"

		expect(page).to have_text("Product was successfully created.")
	end

	scenario "Add new product without a name" do
		visit "/products/new"

		fill_in "Name", :with => ""
		fill_in "Price", :with => 200
		fill_in "Description", :with => "A description"
		fill_in "Image url", :with => "image.jpg"
		fill_in "Color", :with => "Green"

		click_button "Create Product"

		expect(page).to have_text("Name can't be blank")
	end
	
end