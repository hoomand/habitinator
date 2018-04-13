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

ActiveRecord::Schema.define(version: 20_180_409_220_801) do
  create_table 'categories', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'name'
    t.integer 'unit_type'
    t.string 'unit_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'goals', force: :cascade do |t|
    t.integer 'category_id'
    t.string 'name'
    t.date 'end_target'
    t.decimal 'frequency'
    t.integer 'goal_value'
    t.boolean 'archived'
    t.boolean 'new_entry_add_to_total'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ledgers', force: :cascade do |t|
    t.integer 'goal_id'
    t.integer 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.integer 'role'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
