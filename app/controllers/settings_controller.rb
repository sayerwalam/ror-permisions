class SettingsController < ApplicationController

	def index
		all_content
	end

	def update
		@update = User.where(id: params[:id])
									.update_all(permission: user_params[:permission])
		all_content
	end

	def message

		@updated = Setting.all[0]
		@updated.update_attributes(body: setting_params[:body],
										 		  	 duration: setting_params[:duration])
		all_content
	end

private

	def user_params
  	params.require(:user).permit(:id, :permission)
  end

	def setting_params
		params.require(:setting).permit(:body, :duration)
	end

	def get_message
		@message = Setting.all[0]
		if @message == nil
			new_setting
			@message = Setting.all[0]
		end
		puts @message.inspect
	end

	def new_setting
		@message = Setting.new

		@message.id = 1
		@message.body = 'empty'
		@message.duration = '00:00:00'

		@message.save
	end

	def all_content
		@content = String.new('settings')
		@users = User.all.order("id ASC")
		get_message
		render'material_admin/home.html.erb'
	end
end
