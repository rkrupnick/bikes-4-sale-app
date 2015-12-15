require 'rails_helper'

describe UsersController do
  before do 
    @user = FactoryGirl.create(:user)
    @user2 = create(:user, email: "user2@example.com", password: "12345678")
  end
  
  describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in @user
      end

      it "loads correct user details" do
        get :show, id: @user.id
        expect(assigns(:user)).to eq @user
      end

      it "redirects to home if user tries to access another users show page" do
        get :show, id: @user2.id
        expect(response).to redirect_to(root_path)
      end
    end

    context "No user is logged in" do
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to(root_path)
      end
    end
  end
end