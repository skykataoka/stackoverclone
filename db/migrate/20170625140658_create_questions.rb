class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string,content :title

      t.timestamps null: false
    end
  end
end
