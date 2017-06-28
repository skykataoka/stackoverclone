class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

  def create
   @answer = Answer.new(answer_params)
    if @answer.save
     redirect_to new_answer_path, notice: "投稿しました"
    else
     render 'index'
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


  private
    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end
end
