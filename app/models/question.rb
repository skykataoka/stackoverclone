class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # tag
  acts_as_taggable

  #バリデーション
 validates :title, :content, presence: true

end
