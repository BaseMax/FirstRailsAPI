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

ActiveRecord::Schema.define(version: 2021_06_12_222005) do

  create_table "account", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_persian_ci", force: :cascade do |t|
    t.string "phoneNumber", limit: 17, null: false
    t.string "name", limit: 60
    t.string "username", limit: 36
    t.string "biography", limit: 256
    t.string "website", limit: 256
    t.integer "image", unsigned: true
    t.integer "datetimeRegister", null: false, unsigned: true
    t.integer "status", limit: 1, null: false, comment: "1=active, 2=without verification", unsigned: true
    t.index ["phoneNumber"], name: "phoneNumber"
    t.index ["phoneNumber"], name: "phoneNumber_2", unique: true
    t.index ["status"], name: "status"
    t.index ["username"], name: "username"
    t.index ["username"], name: "username_2", unique: true
  end

  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_persian_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guest", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_persian_ci", force: :cascade do |t|
    t.integer "accountID", unsigned: true
    t.string "sessionID", limit: 36, null: false
    t.string "authID", limit: 36, null: false
    t.integer "datetimeRegister", null: false, unsigned: true
    t.integer "datetimeLastUse", null: false, unsigned: true
    t.index ["authID"], name: "authID"
    t.index ["sessionID"], name: "sessionID"
  end

  create_table "session", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_persian_ci", force: :cascade do |t|
    t.integer "accountID", null: false, unsigned: true
    t.string "authID", limit: 36, null: false
    t.string "sessionID", limit: 36
    t.integer "verifyCode", limit: 2, null: false, unsigned: true
    t.integer "verifyCodeAttemp", limit: 1, default: 0, null: false, unsigned: true
    t.integer "versionCode", limit: 1, null: false, unsigned: true
    t.integer "platform", limit: 1, null: false, comment: "1=web, 2=android, 3=ios", unsigned: true
    t.integer "status", limit: 1, null: false, comment: "0=banned, 1=only session, 2=normal id", unsigned: true
    t.integer "datetime", null: false, unsigned: true
    t.index ["accountID"], name: "accountID"
    t.index ["authID"], name: "authID"
    t.index ["datetime"], name: "datetime"
    t.index ["sessionID"], name: "sessionID"
    t.index ["status"], name: "status"
    t.index ["verifyCode"], name: "verifyCode"
    t.index ["versionCode"], name: "versionCode"
    t.index ["versionCode"], name: "versionCode_2"
    t.index ["versionCode"], name: "versionCode_3"
    t.index ["versionCode"], name: "versionCode_4"
  end

end
