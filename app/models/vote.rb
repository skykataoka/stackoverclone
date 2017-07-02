class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
  belongs_to :user
  scope :question_between, -> (question_id, user_id) do
    where("votes.question_id = ? AND votes.user_id = ?", question_id, user_id)
  end

  # 投票(加算用)メソッド
  def self.add_vote(target_id, user_id, target)
    if target == "question"
      vote = Vote.new(question_id: target_id)
    else
      # 回答用の処理を記述
    end
    vote.user_id = user_id
    vote.cnt += 1
    vote.save
  end
end
