class AnswersController < ApplicationController
  #ログインしていなければAnswerを使用できないようにする(Deviseのauthenticate_user!メソッドを使用)
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy]

  def new
    @answer = Answer.new
  end

   #回答を保存、投稿するためのアクションです。
     def create
     #質問と紐付ける
     @answer = current_user.answers.build(answer_params)
    #  binding.pry
     @question = @answer.question


     # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: '回答を投稿しました。' }
        # format.html { render :new }
      end
    end
 end


  def edit

  end

  def update
    if @answer.save
    @answer.update(answer_params)
     redirect_to question_path(@answer.question.id), notice: "回答を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.js
      format.html{ render :new }
    end
  end

  def show
  end


  private
    def answer_params
      params.require(:answer).permit(:content,:question_id)
    end

    def set_answer
      @answer = Answer.find(params[:id])

    end
end
