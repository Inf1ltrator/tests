class CreateAnswerLists < ActiveRecord::Migration
  def change
    create_table :answer_lists do |t|
      t.string :name
      t.text :description	
      t.integer :score	
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
