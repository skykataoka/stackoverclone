class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  #バリデーション
  validates :content, presence: true
end
