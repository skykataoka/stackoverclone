class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
  belongs_to :user

  def self.add_vote(target_id, user_id, target)
    if target == "question"
      vote = Vote.new(question_id: target_id)
    else
      vote = Vote.new(answer_id: target_id)
    end
    vote.user_id = user_id
    vote.cnt += 1
    vote.save
  end
end
