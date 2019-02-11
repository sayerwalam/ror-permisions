class UserController < ApplicationController

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
    user = User.find_by(email: user_params[:email])
    if user.nil? == false && user.authenticate(user_params[:password])
      session[:first_name] = user.first_name
      session[:last_name] = user.last_name
      session[:dob] = user.dob
      session[:email] = user.email
      render "user/home.html.erb"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "index"
    end
  end

  def logout

    new_user
    session[:first_name] = nil
    session[:last_name] = nil
    session[:dob] = nil
    session[:email] = nil
    render'user/index.html.erb'

  end


private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :dob, :email, :password, :password_confirmation)
  end

  def get_user
    User.where(email: params[:email])
  end

  def new_user
    @user = User.new
  end

end
