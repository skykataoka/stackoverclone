class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

   #回答を保存、投稿するためのアクションです。
  def create
     #質問と紐付ける
     @answer = current_user.answers.build(answer_params)
     @question = @answer.question
     # クライアント要求に応じてフォーマットを変更
     respond_to do |format|

    if @answer.save
      format.html { render :new }
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
      params.require(:answer).permit(:question_id, :content)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end
end
