class MaterialAdminController < ApplicationController

  def index
    new_user
  end

  def create

    @user = User.new(user_params)
    if @user.save
    end
    render "index"

  end

  def login

    @user = get_user
    if @user.length == 1
      @content = String.new('home')
      session[:user_id] = @user[0].id
      session[:permission] = @user[0].permission
      session[:username] = @user[0].username
      render'material_admin/home.html.erb'
    else
      flash[:notice] = "Invalid Username or Password"
    end

  end

  def logout

    new_user
    session[:user_id] = nil
    session[:permission] = nil
    render'material_admin/index.html.erb'

  end

  def get_settings
    @content = String.new('settings')
    render'material_admin/home.html.erb'
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :permission)
  end

  def get_user
    User.where('username = ? AND password = ?',
                user_params[:username],
                user_params[:password])
  end

  def new_user
    @user = User.new
  end

end
