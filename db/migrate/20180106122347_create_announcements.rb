class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string "Subject_ID"
      t.string "Announcements"
      t.timestamps
    end
  end
end
