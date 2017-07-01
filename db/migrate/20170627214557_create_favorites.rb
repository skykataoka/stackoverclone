class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, counter_cache: :favorites_count
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
