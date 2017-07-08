class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes

  #バリデーション
  validates :content, presence: true

  # 質問に紐づく投票の評価値の合計を返す。
  def votes_count
    sum = 0
    self.votes.each{ |vote| sum += vote.cnt }
    return sum
  end
end
