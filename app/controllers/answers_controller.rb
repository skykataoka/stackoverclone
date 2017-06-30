class AnswersController < ApplicationController
  #ログインしていなければAnswerを使用できないようにする(Deviseのauthenticate_user!メソッドを使用)
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy]

  def new
    @answer = Answer.new
  end

   #回答を保存、投稿するためのアクションです。
  def create
    # binding.pry
     #質問と紐付ける
     answers_params = params.require(:answer).permit(:content)
     @answer = current_user.answers.build(answers_params)
     @question = @answer.question

    #  question_idの書き込み
    #  @question.question_id = @question.id

     # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: 'コメントを投稿しました。' }
        # format.html { render :new }
      end

    end
 end


  def edit
  end

  def update
    @answer.update(answers_params)
  end

  def destroy
    @answer.destroy
    redirect_to answer_path
  end

  def show
  end


  private
    def answer_params
      params.require(:answer).permit(:content)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end
end
