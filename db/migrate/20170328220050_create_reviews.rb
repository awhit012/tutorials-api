class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :tutorial, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
