class CreateStdlists < ActiveRecord::Migration[5.1]
  def change
    create_table :stdlists do |t|
      t.string "Subject_ID"
      t.string "Rollnumber"
      
    end
  end
end
