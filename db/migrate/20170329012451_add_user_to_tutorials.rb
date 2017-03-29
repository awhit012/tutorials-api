class AddUserToTutorials < ActiveRecord::Migration[5.0]
  def change
    add_reference :tutorials, :user, foreign_key: true
  end
end
