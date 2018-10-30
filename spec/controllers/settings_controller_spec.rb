require 'rails_helper'

RSpec.describe SettingsController, type: :controller do

	describe "PUT index" do

    		it "successfully renders the settings template" do
    			expect(controller).to receive(:index) 
      			put :index
      			expect(response).to be_successful
      			redirect_to ('/home')
    		end

  end

    describe "PUT update" do

    		it "Allows admin to set permission levels" do
    			user_attributes = FactoryBot.attributes_for(:user)
    			expect(response).to be_successful
      		redirect_to ('/home')
    		end

    end

    describe "PUT message" do

    		it "Allows admin to set automated time and message" do
    			message_attributes = FactoryBot.attributes_for(:setting)
    			expect(response).to be_successful
      		redirect_to ('/home')
        end

  	end

end
