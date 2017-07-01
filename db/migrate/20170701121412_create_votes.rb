class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id
      t.integer :cnt

      t.timestamps null: false
    end
    add_index :votes, :user_id
    add_index :votes, :question_id
    add_index :votes, :answer_id
    add_index :votes, [:user_id, :question_id], unique: true
    add_index :votes, [:user_id, :answer_id],   unique: true
  end
end
