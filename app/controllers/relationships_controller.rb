class RelationshipsController < ApplicationController

  #フォローするとき
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
		redirect_to request.referer
  end

  #フォロー外すとき
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
		redirect_to request.referer
  end

  # フォローフォロワー一覧処理
  def followings
    user = User.find(params[:user_id])
		@users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
		@users = user.followers
  end

end
