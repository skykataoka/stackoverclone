class FavoritesController < ApplicationController
  def create
    #お気に入りに入れる
    @favorite = Favorite.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @favorites = Favorite.where(tweet_id: params[:tweet_id])
    @questions = Question.all
  end

  def destroy
    #お気に入りから外す
    favorite = favorite.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    favorite.destroy
    @favorites = Favorite.where(tweet_id: params[:tweet_id])
    @Questions = Question.all
  end
end
