class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def create
    User.create!({:email => params[:user][:email],
      :password => params[:user][:password],
      :password_confirmation => params[:user][:password] })
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end

end
