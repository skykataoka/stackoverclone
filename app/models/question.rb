class Question < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  # tag
  acts_as_taggable
end
