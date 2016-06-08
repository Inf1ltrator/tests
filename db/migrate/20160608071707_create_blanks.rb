class CreateBlanks < ActiveRecord::Migration
  def change
    create_table :blanks do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
