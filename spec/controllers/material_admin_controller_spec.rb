require 'rails_helper'

RSpec.describe MaterialAdminController, type: :controller do

	describe "GET index" do
    
    		it "successfully renders the index template" do
      		expect(controller).to receive(:index) 
      		get :index
      		expect(response).to be_successful
      		expect(response).to render_template(:index)
        end
  end

  describe "Create" do

      	it "creates a User" do
    			   user_attributes = FactoryBot.attributes_for(:user)
  				  expect(response).to be_successful
      			 redirect_to(root_path)
    		end
  end

  describe "GET index" do

    		it "redirects to the home page upon sign in " do
    			user_attributes = FactoryBot.attributes_for(:user)
    			expect(response).to be_successful
    			redirect_to '/home'
    		end
  end

  describe "GET Logout" do

    		it "allows user to logout of the system" do
          get :logout
    			 redirect_to(root_path)
    	 end
  end

end
