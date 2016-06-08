class AddAnswersToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :asnwer1, :string
    add_column :questions, :answer2, :string
  end
end
