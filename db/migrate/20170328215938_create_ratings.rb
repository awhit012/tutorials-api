class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :tutorial, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
