class FavoritesController < ApplicationController
  def create
    #お気に入りに入れる
    @favorite = Favorite.create(user_id: current_user.id, question_id: params[:question_id])
    @favorites = Favorite.where(question_id: params[:question_id])
    @questions = Question.all
  end

  def destroy
    #お気に入りから外す
    favorite = favorite.find_by(user_id: current_user.id, question_id: params[:question_id])
    favorite.destroy
    @favorites = Favorite.where(question_id: params[:question_id])
    @Questions = Question.all
  end
end
