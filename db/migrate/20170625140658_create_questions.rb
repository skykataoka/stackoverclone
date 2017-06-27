class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
<<<<<<< HEAD
      t.string :title
      t.text :content

||||||| merged common ancestors
      t.string,content :title

=======
      t.string :title
      t.text :content
>>>>>>> af52238ff811050fcc8fc2e8b40b8f84875af32b
      t.timestamps null: false
    end
  end
end
