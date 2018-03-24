class CreateSignups < ActiveRecord::Migration[5.1]
  def change
    create_table :signups do |t|
      t.string "rollnumber"
      t.string "password"
      t.boolean "role" , :default => false
      t.timestamps
    end
  end
end
