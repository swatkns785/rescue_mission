class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer, null: false
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.integer :votes
      t.timestamps
    end
  end
end
