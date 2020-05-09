class FollowsController < ApplicationController
  before_action :authenticate_user
  before_action :set_category
  before_action :set_user
  before_action :verify_user

  def follow_category
    unless @user.categories.include?(@category)
      @category.users << @user
    end
    redirect_to @user
  end

  def unfollow_category
    unless !@user.categories.include?(@category)
      @category.users.delete(@user)
    end
    redirect_to @user
  end

  private

  def set_category
    @category = Category.find_by(id: params[:category_id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def verify_user
    redirect_to user_path(current_user) unless @user == current_user
  end
end