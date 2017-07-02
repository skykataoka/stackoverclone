class VotesController < ApplicationController
  def create
    if params[target] == "question"
      target = Question.find(params[question_id])
    else 
      target = Answer.find(params[answer_id])
    end
    Vote.add_vote(target.id, current_user.id, params[target])
  end

  def destroy
  end
end
