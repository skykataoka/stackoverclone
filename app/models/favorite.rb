class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :questions, counter_cache: :favorites_count
end
