# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_328_163_240) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table 'cars', force: :cascade do |t|
    t.string 'brand'
    t.string 'model'
    t.integer 'model_year'
    t.string 'photo_url'
    t.text 'description'
    t.boolean 'reserved', default: false
    t.decimal 'rent_fee'
    t.integer 'likes_counter', default: 0
    t.integer 'reservation_counter', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reservations', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'car_id', null: false
    t.string 'start_date'
    t.string 'city'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['car_id'], name: 'index_reservations_on_car_id'
    t.index ['user_id'], name: 'index_reservations_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'city'
    t.text 'photo'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'role', default: 'user'
  end

  add_foreign_key 'reservations', 'cars'
  add_foreign_key 'reservations', 'users'
end
