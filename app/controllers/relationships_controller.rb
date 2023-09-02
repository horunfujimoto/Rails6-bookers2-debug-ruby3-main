class RelationshipsController < ApplicationController

  #フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  #フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォローフォロワー一覧処理
  def followings
    user = User.find(params[:user_id])
    @users = user.following_users
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.follower_users
  end

  def show
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

end
