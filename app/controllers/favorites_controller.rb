class FavoritesController < ApplicationController
  #お気に入りに入れる
  def create
    # ログインユーザidをuser_idカラムに代入　選択中のquestion_idをquestion_idカラムに代入
    @favorite = Favorite.create(user_id: current_user.id, question_id: params[:question_id])
    # 選択した質問につけられたお気に入りのデータを全部取得
    @favorites = Favorite.where(question_id: params[:question_id])
    # お気に入りの質問一覧を表示させるため全ての質問データを取得
    @questions = Question.all
  end
　#お気に入りから外す
  def destroy
    # ログインユーザidをuser_idカラムに代入　選択中のquestion_idをquestion_idカラムに代入
    @favorite = Favorite.find_by(user_id: current_user.id, question_id: params[:question_id])
    @favorite.destroy
    #　選択した質問につけられたお気に入りのデータを全部取得
    @favorites = Favorite.where(question_id: params[:question_id])
    # お気に入りの質問一覧を表示させるため全ての質問データを取得
    @Questions = Question.all
  end
end
