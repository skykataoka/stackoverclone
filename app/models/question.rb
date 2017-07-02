class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :votes, dependent: :destroy

  # tag
  acts_as_taggable

  #バリデーション
 validates :title, :content, presence: true

  # 質問の評価数を返す
  def votes_count
    sum = 0
    self.votes.each{ |vote| sum += vote.cnt }
    return sum
  end
end
