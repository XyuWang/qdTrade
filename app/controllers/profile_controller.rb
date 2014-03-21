class ProfileController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes params[:user].permit(:nickname, :renren_url, :avatar)
      redirect_to edit_profile_path, notice: "成功"
    else
      redirect_to edit_profile_path, alert: @user.errors.full_messages.to_sentence
    end
  end
  
  def show
    @user = User.find params[:id]
    @posts = @user.posts.public
  end
end
