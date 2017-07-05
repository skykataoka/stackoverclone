class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # ユーザーの質問及び回答一覧を取得
    @questions = @user.questions
    @answers = @user.answers
  end

end
