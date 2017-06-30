class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  #バリデーション
  validates :content, presence: true
end
