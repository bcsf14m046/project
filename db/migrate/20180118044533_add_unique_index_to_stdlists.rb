class AddUniqueIndexToStdlists < ActiveRecord::Migration[5.1]
  def change
    add_index :stdlists, [:Subject_ID, :Rollnumber], unique: true
  end
end
