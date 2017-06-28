class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

   #回答を保存、投稿するためのアクションです。
   def create
     #質問と紐付ける
     @answer = answers.build(answer_params)
     @question = @answer.question
    
    if @answer.save
      render :index
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
