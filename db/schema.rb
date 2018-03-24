# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180118044533) do

  create_table "LoGin", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name", limit: 50
    t.string "roll_num", limit: 50
    t.string "password", limit: 40
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "announcements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "Subject_ID"
    t.string "Announcements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "haiders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "subject_id"
    t.string "name"
    t.integer "position"
    t.string "permalink"
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permalink"], name: "index_pages_on_permalink"
    t.index ["subject_id"], name: "index_pages_on_subject_id"
  end

  create_table "sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "page_id"
    t.string "name"
    t.integer "position"
    t.boolean "visible", default: false
    t.string "content_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_sections_on_page_id"
  end

  create_table "signups", primary_key: "rollnumber", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "password"
    t.boolean "role", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stdlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "Subject_ID"
    t.string "Rollnumber"
    t.string "dummy", default: "haider"
    t.index ["Subject_ID", "Rollnumber"], name: "index_stdlists_on_Subject_ID_and_Rollnumber", unique: true
  end

  create_table "students", primary_key: "Subject_ID", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "User"
    t.boolean "pending", default: false
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "position"
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rollnumber", limit: 50
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
