class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  mount_uploader :avatar, AvatarUploader #deviseの設定配下に追記

  #アソシエーション 
  has_many :favorites, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :votes, dependent: :destroy

  #バリデーション
  validates :name, presence: true


  def already_vote(target_id, target)
    if target == "question"
      votes.find_by(question_id: target_id)
    else
      votes.find_by(answer_id: target_id)
    end
  end
end
