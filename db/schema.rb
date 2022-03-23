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

ActiveRecord::Schema[7.0].define(version: 2022_03_22_161459) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "pkmn_abilities", force: :cascade do |t|
    t.integer "pkmn_general_id"
    t.integer "abilities_num"
    t.string "ability_1"
    t.string "ability_2"
    t.string "ability_hidden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"pkmn_id\"", name: "index_pkmn_abilities_on_pkmn_id"
  end

  create_table "pkmn_breedings", force: :cascade do |t|
    t.integer "pkmn_general_id"
    t.string "growth_rate"
    t.integer "catch_rate"
    t.float "percentage_male"
    t.string "egg_type_1"
    t.string "egg_type_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pkmn_generals", force: :cascade do |t|
    t.integer "pkmn_general_id"
    t.string "dex_num"
    t.string "name"
    t.string "gen"
    t.string "species"
    t.integer "type_count"
    t.string "type_1"
    t.string "type_2"
    t.string "height"
    t.string "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pkmn_stats", force: :cascade do |t|
    t.integer "pkmn_general_id"
    t.integer "total_points"
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
    t.integer "sp_attack"
    t.integer "sp_defense"
    t.integer "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
