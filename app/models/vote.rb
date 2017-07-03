class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
  belongs_to :user

  # 投票メソッド
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

  # 投票取り消しメソッド
  # todo:減算に対応する。
  def self.subtract_vote(target_id)
    vote = Vote.find(target_id)
    vote.destroy
  end
end
