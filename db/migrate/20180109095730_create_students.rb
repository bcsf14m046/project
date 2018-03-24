class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string "Subject_ID"
      t.string "Student"
      t.boolean "Request" ,:default =>false
      t.timestamps
    end
  end
end
