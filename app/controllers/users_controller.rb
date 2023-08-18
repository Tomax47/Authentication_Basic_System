
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      redirect_to blogposts_path
      session[:user_id] = @user.id

    else
      redirect_to users_new_path, notice: @user.errors.full_messages.to_sentence
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
