class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorite_user(user_id)
    #questionに紐つくfavoritesの中から検索条件を指定して、最初の1件を取得する
   favorites.find_by(user_id: user_id)
  end

  has_many :votes, dependent: :destroy
  # tag
  acts_as_taggable

  #バリデーション
  validates :title, :content, presence: true
  
  # 質問に紐づく投票の評価値の合計を返す。
  def votes_count
    sum = 0
    self.votes.each{ |vote| sum += vote.cnt }
    return sum
  end

end
