class CreatePages < ActiveRecord::Migration[5.1]
  def self.up
    create_table :pages do |t|
      t.integer "subject_id"
      t.string "name"
      t.integer "position"
      t.string "permalink"
      t.boolean "visible" , :default => false


      t.timestamps
    end
    add_index("pages","subject_id")
    add_index("pages","permalink")
  end
  def self.down
    drop_table pages
  end
end
