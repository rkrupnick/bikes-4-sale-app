require 'rails_helper'

describe ProductsController do
	before do
		@product = create(:product)
	end

	context "GET #index" do
		before do
			get :index
		end

		it "responds successfully with an HTTP 200 status code" do
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			expect(response).to render_template("index")
		end
	end

	context "GET #show" do
		before do
			get :show, id: @product.id
		end

		it "responds successfully with an HTTP 200 status code" do
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the show template" do
			expect(response).to render_template("show")
		end
	
		it "loads correct product details" do
			expect(assigns(:product)).to eq @product
		end
	end


	context "GET #new" do
		before do
			get :new
		end

		it "responds successfully with an HTTP 200 status code" do
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the new template" do
			expect(response).to render_template("new")
		end
	end

	
end

