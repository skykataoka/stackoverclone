class VotesController < ApplicationController
  before_action :set_target

  def create
    # 投票処理の呼び出し
    Vote.add_vote(@target.id, current_user.id, @destination)
    redirect_to @redirect_path
  end

  def destroy
    # 投票取り消し処理の呼び出し
    Vote.subtract_vote(params["vote"]["id"])
    redirect_to @redirect_path
  end

  private

  def set_target
    # 対象が質問か、回答かを変数に格納
    @destination = params["vote"]["target"]
    # 質問の場合、質問を取得し遷移先に自身を格納
    if @destination == "question"
      @target = Question.find(params["vote"]["question_id"])
      @redirect_path = @target
    else 
      @target = Answer.find(params["vote"]["answer_id"])
      @redirect_path = @target.question
    end
  end
end
