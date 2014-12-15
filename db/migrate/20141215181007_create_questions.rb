class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_name, null: false
      t.integer :user_id, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
