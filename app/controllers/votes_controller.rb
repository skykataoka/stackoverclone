class VotesController < ApplicationController
  def create
    destination = params["vote"]["target"]
    if destination == "question"
      target = Question.find(params["vote"]["question_id"])
      redirect_path = target
    else 
      # 回答用の処理を記述
    end
    Vote.add_vote(target.id, current_user.id, destination)
    redirect_to redirect_path
  end

  def destroy
    destination = params["vote"]["target"]
    if destination == "question"
      target = Question.find(params["vote"]["question_id"])
      redirect_path = target
    else 
      # 回答用の処理を記述
    end
    Vote.subtract_vote(params["vote"]["id"])
    redirect_to redirect_path
  end
end
