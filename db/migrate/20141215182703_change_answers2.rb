class ChangeAnswers2 < ActiveRecord::Migration
  def change
    add_column :answers, :answer, :text, null: false
  end
end
