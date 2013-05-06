# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130502043300) do

  create_table "exam_images", :force => true do |t|
    t.integer  "examination_id"
    t.string   "image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "caption"
  end

  create_table "examinations", :force => true do |t|
    t.string   "anamnezis"
    t.string   "status"
    t.string   "treatment"
    t.integer  "charge"
    t.integer  "guest_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "guests", :force => true do |t|
    t.text     "name"
    t.date     "birth"
    t.text     "mother"
    t.text     "address"
    t.text     "city"
    t.integer  "postal_code"
    t.text     "phone"
    t.text     "email"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id"
    t.string   "allergies"
    t.string   "diseases"
    t.string   "medicines"
    t.boolean  "contraceptive"
    t.string   "vitamins"
    t.boolean  "hormon_treatment"
    t.boolean  "smoking"
    t.decimal  "litres_of_liquid_per_day"
    t.boolean  "sun_protector"
    t.string   "main_problem"
    t.string   "problem_appeared"
    t.string   "possible_reason_of_problem"
    t.boolean  "visited_dermatologist"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "salt"
    t.string   "hashed_password"
    t.string   "language"
  end

end
