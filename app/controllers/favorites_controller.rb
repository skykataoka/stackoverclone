class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, question_id: params[:question_id])
    @favorites = Favorite.where(question_id: params[:question_id])
    @questions = Question.all
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, question_id: params[:question_id])
    favorite.destroy
    @favorites = Favorite.where(question_id: params[:question_id])
    @Questions = Question.all
  end
end
