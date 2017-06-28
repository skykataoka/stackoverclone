class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :favorites

  #バリデーション
 validates :title, presence: true
 validates :content, presence: true
end
