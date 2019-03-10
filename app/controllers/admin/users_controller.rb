class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def create
    user = User.new({:email => params[:user][:email],
      :password => params[:user][:password],
      :password_confirmation => params[:user][:password] })
    if user.save
      flash[:success] = 'User created! You will need to send them their password'
    else
      flash[:danger] = 'Error creating user: ' + user.errors.full_messages.to_sentence
    end
    redirect_to settings_path
  end

  #TODO: reintroduce once scoped to superuser role
  # def destroy()
  #   user = User.find(params[:id])
  #   if user.destroy()
  #     flash[:success] = 'User deleted!'
  #   else
  #     flash[:danger] = 'Error creating user: ' + user.errors.full_messages.to_sentence
  #   end
  #   redirect_to settings_path
  # end

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end

end
