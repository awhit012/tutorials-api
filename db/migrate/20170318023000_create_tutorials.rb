class CreateTutorials < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :description
      t.string :url
      t.integer :difficulty
      t.integer :duration

      t.timestamps
    end
  end
end
