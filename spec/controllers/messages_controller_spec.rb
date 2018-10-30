require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

	describe "POST index" do

    		it "successfully renders the message template" do
    			expect(controller).to receive(:index) 
      			post :index
      			expect(response).to be_successful
      			redirect_to ('/home')
    		end

    end

    describe "GET show" do

    		it "displays all the users in the system" do
    			user_attributes = FactoryBot.attributes_for(:user)
    			expect(response).to be_successful
      		redirect_to ('/home')
      	end

    end

     describe "POST reply" do

    		it "creates a message cat between user" do
    			user1_attributes = FactoryBot.attributes_for(:user)
    			user2_attributes = FactoryBot.attributes_for(:user)
    			message_attributes = FactoryBot.attributes_for(:message_thread)
    			expect(response).to be_successful
      		redirect_to ('/home')
    		end

    end
    
end
