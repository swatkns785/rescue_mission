class ChangeAnswers1 < ActiveRecord::Migration
  def change
    remove_column :answers, :answer, :string
  end
end
