class MessagesController < ApplicationController

	def index

		all_content_new_message
		render'material_admin/home.html.erb'

	end

	def show

		@user2 = get_user(params[:id])
		all_content_new_message

		render 'material_admin/home.html.erb'
	end

	def reply
		@message = MessageThread.new(message_params)
		@user2 = get_user(params[:id])

		save_message
    automated_message

		render 'material_admin/home.html.erb'
	end

private

	def message_params
		params.require(:message).permit(:user1, :user2, :body)
	end

	def setting_params
		params.require(:Setting).permit(:id, :body)
	end

	def get_messages(user1, user2)
		@messages = MessageThread.where('user1 = ? AND user2 = ? OR user1 = ? AND user2 = ?',
                                            user1, user2, user2, user1)
                                         .order("created_at ASC")
	end

	def get_user(id)
		User.where('id = ?', id)[0]
	end

	def set_content
		@content = String.new('messages')
		@users = User.where.not(id: session[:user_id])
	end

	def all_content
		set_content
		@user = get_user(session[:user_id])

		if @user2 == nil
			@user2 = @users[0]
		end

		get_messages(@user.username, @user2.username)
	end

	def all_content_new_message
		all_content
		@message = MessageThread.new
	end

	def save_message
		@message.save
		all_content_new_message
	end

	def automated_message
		@auto_message = Setting.all[0]
		@body = @auto_message.body
	end

end
