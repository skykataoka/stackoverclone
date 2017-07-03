class AddDefaultOptionVote < ActiveRecord::Migration
  def change
    change_column :votes, :cnt, :integer, default: 0
  end
end
